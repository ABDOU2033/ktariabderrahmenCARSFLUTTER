import 'package:flutter/material.dart';
import 'icon_info.dart';

class SectionIcone extends StatelessWidget {
  const SectionIcone({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconInfo(
              icon: Icons.directions_car,
              text: "Voitures",
              onTap: () => Navigator.pushNamed(context, '/liste')),
          IconInfo(
              icon: Icons.favorite,
              text: "Favoris",
              onTap: () => Navigator.pushNamed(context, '/favoris')),
          IconInfo(
              icon: Icons.price_change,
              text: "Prix",
              onTap: () => Navigator.pushNamed(context, '/prix')),
          IconInfo(
              icon: Icons.phone,
              text: "TEL",
              onTap: () => Navigator.pushNamed(context, '/tel')),
        ],
      ),
    );
  }
}
