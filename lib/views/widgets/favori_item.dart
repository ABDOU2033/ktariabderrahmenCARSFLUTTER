import 'package:flutter/material.dart';

class FavoriItem extends StatelessWidget {
  final String image;
  final String nom;
  final VoidCallback onDelete;

  const FavoriItem(
      {super.key,
      required this.image,
      required this.nom,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset("assets/$image",
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.car_rental, size: 40, color: Colors.red))),
        title: Text(nom, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: onDelete),
      ),
    );
  }
}
