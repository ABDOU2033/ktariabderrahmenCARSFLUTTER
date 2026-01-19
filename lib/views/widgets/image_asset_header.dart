import 'package:flutter/material.dart';

class ImageAssetHeader extends StatelessWidget {
  const ImageAssetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Image.asset("assets/banner.jpg", fit: BoxFit.cover,
          errorBuilder: (_, __, ___) {
        return Container(
          color: Colors.red[100],
          child: const Center(
              child: Icon(Icons.directions_car, size: 80, color: Colors.red)),
        );
      }),
    );
  }
}
