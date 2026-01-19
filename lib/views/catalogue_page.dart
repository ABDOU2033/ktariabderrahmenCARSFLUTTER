import 'package:flutter/material.dart';
import 'widgets/canvas_wrapper.dart';
import 'widgets/category_card.dart';

class PageCatalogueCategories extends StatelessWidget {
  const PageCatalogueCategories({super.key});

  static const List<Map<String, dynamic>> categories = [
    {
      "type": "SUV",
      "image": "suv.jpg",
      "description": "Puissants et spacieux",
      "status": "arrivage",
      "color1": Colors.red,
      "color2": Colors.orange
    },
    {
      "type": "Berline",
      "image": "berline.jpg",
      "description": "Élégantes et confortables",
      "status": "arrivage",
      "color1": Colors.blue,
      "color2": Colors.lightBlue
    },
    {
      "type": "Sportive",
      "image": "sportive.jpg",
      "description": "Rapides et dynamiques",
      "status": "arrivage",
      "color1": Colors.purple,
      "color2": Colors.pink
    },
    {
      "type": "Électrique",
      "image": "electrique.jpg",
      "description": "Écologiques et innovantes",
      "status": "arrivage",
      "color1": Colors.green,
      "color2": Colors.teal
    },
    // You can add categories with status: "disponible"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Catalogue en arrivage"),
          backgroundColor: Colors.red),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          return CanvasWrapper(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: CategoryCard(
              type: cat["type"],
              description: cat["description"],
              image: cat["image"],
              color1: cat["color1"],
              color2: cat["color2"],
              status: cat["status"],
            ),
          );
        },
      ),
    );
  }
}
