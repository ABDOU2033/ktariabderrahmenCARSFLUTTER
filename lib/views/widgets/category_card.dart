import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String type;
  final String description;
  final String image;
  final Color color1;
  final Color color2;
  final String status;

  const CategoryCard(
      {super.key,
      required this.type,
      required this.description,
      required this.image,
      required this.color1,
      required this.color2,
      this.status = "arrivage"});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: const EdgeInsets.only(bottom: 8),
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [color1, color2]),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, blurRadius: 6, offset: Offset(0, 3))
          ],
        ),
        child: Row(children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(type,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    const SizedBox(height: 6),
                    Text(description,
                        style: const TextStyle(color: Colors.white70)),
                  ]),
            ),
          ),
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              child: Image.asset("assets/$image",
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.directions_car,
                      size: 50, color: Colors.white)),
            ),
          ),
        ]),
      ),
      Positioned(
        top: 12,
        right: 12,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
              color: status == "disponible" ? Colors.green : Colors.orange,
              borderRadius: BorderRadius.circular(8)),
          child: Text(status == "disponible" ? "Disponible" : "En arrivage",
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    ]);
  }
}
