import 'package:flutter/material.dart';
import 'canvas_wrapper.dart';
import 'car_service_item.dart';

class SectionService extends StatelessWidget {
  const SectionService({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
            padding: EdgeInsets.all(16),
            child: Text("Nos voitures disponibles",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [
          CanvasWrapper(
              child: CarServiceItem(image: "car1.jpg", label: "Mercedes")),
          CanvasWrapper(child: CarServiceItem(image: "car2.jpg", label: "BMW")),
        ]),
        const SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [
          CanvasWrapper(
              child: CarServiceItem(image: "car3.jpg", label: "Audi")),
          CanvasWrapper(
              child: CarServiceItem(image: "car4.jpg", label: "Toyota")),
        ]),
      ],
    );
  }
}
