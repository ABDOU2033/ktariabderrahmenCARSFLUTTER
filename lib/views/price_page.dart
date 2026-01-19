import 'package:flutter/material.dart';

class PagePrixVoitures extends StatelessWidget {
  const PagePrixVoitures({super.key});

  static const List<Map<String, dynamic>> voitures = [
    {
      "image": "assets/car1.jpg",
      "nom": "Mercedes Classe C",
      "prix": "40 000 €"
    },
    {"image": "assets/car2.jpg", "nom": "BMW Série 3", "prix": "45 000 €"},
    {"image": "assets/car3.jpg", "nom": "Audi A4", "prix": "42 000 €"},
    {"image": "assets/car4.jpg", "nom": "Toyota Corolla", "prix": "25 000 €"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7ECF8),
      appBar: AppBar(
          title: const Text("Prix des Voitures"), backgroundColor: Colors.red),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: voitures.length,
        itemBuilder: (context, index) {
          final car = voitures[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4))
                  ]),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(car["image"],
                        width: 70,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(
                            Icons.directions_car,
                            size: 40,
                            color: Colors.red))),
                title: Text(car["nom"],
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w600)),
                trailing: Text(car["prix"],
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
              ),
            ),
          );
        },
      ),
    );
  }
}
