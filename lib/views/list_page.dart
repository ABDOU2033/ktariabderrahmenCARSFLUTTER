import 'package:flutter/material.dart';
import 'widgets/canvas_wrapper.dart';

class PageListeVoitures extends StatelessWidget {
  const PageListeVoitures({super.key});

  static const List<Map<String, String>> voitures = [
    {
      "nom": "Mercedes Classe C",
      "image": "car1.jpg",
      "description": "Berline allemande élégante et confortable",
      "prix": "40 000 €"
    },
    {
      "nom": "BMW Série 3",
      "image": "car2.jpg",
      "description": "Voiture sportive et performante",
      "prix": "45 000 €"
    },
    {
      "nom": "Audi A4",
      "image": "car3.jpg",
      "description": "Design moderne avec technologie avancée",
      "prix": "42 000 €"
    },
    {
      "nom": "Toyota Corolla",
      "image": "car4.jpg",
      "description": "Compacte fiable et économique",
      "prix": "25 000 €"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Liste des Voitures"), backgroundColor: Colors.red),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: voitures.length,
        itemBuilder: (context, index) {
          final car = voitures[index];
          return CanvasWrapper(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset("assets/${car["image"]}",
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(
                          Icons.directions_car,
                          size: 40,
                          color: Colors.red)),
                ),
                title: Text(car["nom"]!,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(car["description"]!,
                        style: const TextStyle(
                            fontSize: 13, color: Colors.black87)),
                    const SizedBox(height: 2),
                    Text(car["prix"]!,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
