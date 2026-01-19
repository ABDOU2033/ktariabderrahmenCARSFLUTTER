import 'package:flutter/material.dart';

class SectionTitre extends StatelessWidget {
  const SectionTitre({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Bienvenue dans Cars App 🚗",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          Text("Découvrez les meilleures voitures du marché.",
              style: TextStyle(fontSize: 16, color: Colors.black54)),
        ],
      ),
    );
  }
}
