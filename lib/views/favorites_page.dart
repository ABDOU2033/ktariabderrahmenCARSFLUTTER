import 'package:flutter/material.dart';
import 'widgets/canvas_wrapper.dart';
import 'widgets/favori_item.dart';

class PageFavorisVoitures extends StatefulWidget {
  const PageFavorisVoitures({super.key});

  @override
  State<PageFavorisVoitures> createState() => _PageFavorisVoituresState();
}

class _PageFavorisVoituresState extends State<PageFavorisVoitures> {
  List<Map<String, String>> favoris = [
    {"image": "car1.jpg", "nom": "Mercedes Classe C"},
    {"image": "car3.jpg", "nom": "Audi A4"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Mes Favoris"), backgroundColor: Colors.red),
      body: favoris.isEmpty
          ? const Center(
              child: Text("Aucun favori pour le moment",
                  style: TextStyle(fontSize: 18, color: Colors.grey)))
          : Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                  children: favoris.asMap().entries.map((entry) {
                    final index = entry.key;
                    final voiture = entry.value;
                    return CanvasWrapper(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: FavoriItem(
                        image: voiture["image"]!,
                        nom: voiture["nom"]!,
                        onDelete: () {
                          setState(() => favoris.removeAt(index));
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Favori supprimé")));
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
    );
  }
}
