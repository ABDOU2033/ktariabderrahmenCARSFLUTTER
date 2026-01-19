import 'package:flutter/material.dart';

class CarServiceItem extends StatelessWidget {
  final String image;
  final String label;

  const CarServiceItem({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 140,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 5, offset: Offset(0, 3))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset("assets/$image",
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Icon(Icons.directions_car,
                  color: Colors.red, size: 40)),
        ),
      ),
      const SizedBox(height: 8),
      Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    ]);
  }
}
