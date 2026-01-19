import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../controllers/car_controller.dart';
import '../models/car.dart';
import 'widgets/canvas_wrapper.dart';

class CrudPage extends StatefulWidget {
  const CrudPage({super.key});

  @override
  State<CrudPage> createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  final CarController _carController = CarController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;

  Future<void> _addCar() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      _showError("Veuillez entrer un nom de voiture");
      return;
    }
    setState(() => _isLoading = true);
    try {
      // For simplicity, assuming only name for now
      Car car = Car(name: name);
      await _carController.addCar(car);
      _nameController.clear();
      if (mounted) _showSuccess("Voiture ajoutée ✔");
    } catch (e) {
      _showError("Erreur: $e");
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _searchCar() async {
    final query = _searchController.text.trim();
    if (query.isEmpty) {
      _showError("Veuillez entrer un nom de voiture à rechercher");
      return;
    }
    try {
      List<Car> cars = await _carController.getCars();
      bool found = cars.any((car) => car.name == query);
      if (!found) {
        _showError("Voiture introuvable ❌");
      } else {
        _showSuccess("Voiture trouvée ✔");
      }
    } catch (e) {
      _showError("Erreur: $e");
    }
  }

  Future<void> editCar(String id, String current) async {
    final newName = await showDialog<String>(
      context: context,
      builder: (_) {
        final c = TextEditingController(text: current);
        return AlertDialog(
          title: const Text("Modifier la voiture"),
          content: TextField(controller: c),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Annuler")),
            ElevatedButton(
                onPressed: () => Navigator.pop(context, c.text.trim()),
                child: const Text("OK")),
          ],
        );
      },
    );
    if (newName != null && newName.isNotEmpty) {
      try {
        Car updatedCar = Car(name: newName);
        await _carController.updateCar(id, updatedCar);
        _showSuccess("Voiture modifiée ✔");
      } catch (e) {
        _showError("Erreur: $e");
      }
    }
  }

  Future<void> deleteCar(String id) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Supprimer ?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("Non")),
          ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text("Oui")),
        ],
      ),
    );
    if (ok == true) {
      try {
        await _carController.deleteCar(id);
        _showSuccess("Voiture supprimée ✔");
      } catch (e) {
        _showError("Erreur: $e");
      }
    }
  }

  void _showError(String msg) => ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(msg), backgroundColor: Colors.red));
  void _showSuccess(String msg) => ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), backgroundColor: Colors.green));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Gestion des voitures"),
          backgroundColor: Colors.red),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          // Ajout voiture
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
                labelText: "Nom de la voiture", border: OutlineInputBorder()),
          ),
          const SizedBox(height: 10),
          Row(children: [
            ElevatedButton(
                onPressed: _isLoading ? null : _addCar,
                child: _isLoading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2))
                    : const Text("Ajouter")),
            const SizedBox(width: 12),
            ElevatedButton(
                onPressed: () => _nameController.clear(),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                child: const Text("Effacer")),
          ]),
          const SizedBox(height: 20),
          // Recherche voiture
          TextField(
            controller: _searchController,
            decoration: const InputDecoration(
                labelText: "Rechercher une voiture",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search)),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: _searchCar, child: const Text("Rechercher")),
          const Divider(),
          const SizedBox(height: 6),
          // Liste des voitures
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("cars")
                  .orderBy("createdAt", descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final docs = snapshot.data!.docs;
                if (docs.isEmpty) {
                  return const Center(child: Text("Aucune voiture"));
                }
                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final d = docs[index];
                    final data = d.data() as Map<String, dynamic>;
                    return CanvasWrapper(
                      padding: const EdgeInsets.all(8),
                      child: ListTile(
                        leading: const Icon(Icons.car_repair),
                        title: Text(data["name"] ?? "Sans nom"),
                        trailing:
                            Row(mainAxisSize: MainAxisSize.min, children: [
                          IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () =>
                                  editCar(d.id, data["name"] ?? "")),
                          IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => deleteCar(d.id)),
                        ]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
