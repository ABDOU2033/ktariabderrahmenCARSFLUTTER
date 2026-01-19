import 'package:flutter/material.dart';

class IconInfo extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  const IconInfo(
      {super.key, required this.icon, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Column(children: [
        Icon(icon, size: 36, color: Colors.red),
        const SizedBox(height: 6),
        Text(text),
      ]),
    );
  }
}
