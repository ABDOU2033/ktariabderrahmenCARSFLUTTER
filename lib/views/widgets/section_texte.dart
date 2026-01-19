import 'package:flutter/material.dart';

class SectionTexte extends StatelessWidget {
  const SectionTexte({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: const Text(
        "Cars App vous permet de consulter les modèles, prix et caractéristiques.\n\nGérez votre collection de voitures avec notre système CRUD complet.",
        style: TextStyle(fontSize: 15, height: 1.5),
      ),
    );
  }
}
