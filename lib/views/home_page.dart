import 'package:flutter/material.dart';
import 'widgets/canvas_wrapper.dart';
import 'widgets/image_asset_header.dart';
import 'widgets/section_titre.dart';
import 'widgets/section_texte.dart';
import 'widgets/section_icone.dart';
import 'widgets/section_service.dart';
import 'widgets/app_drawer.dart';

class PageAccueil extends StatelessWidget {
  const PageAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cars App 🚗"),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: const Icon(Icons.apps),
            tooltip: "Menu Interfaces",
            onPressed: () => Navigator.pushNamed(context, '/catalogue'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            CanvasWrapper(
                child: ImageAssetHeader(), padding: EdgeInsets.all(0)),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            CanvasWrapper(
                child: SectionTitre(),
                padding: EdgeInsets.symmetric(horizontal: 8)),
            CanvasWrapper(
                child: SectionTexte(),
                padding: EdgeInsets.symmetric(horizontal: 8)),
            CanvasWrapper(
                child: SectionIcone(),
                padding: EdgeInsets.symmetric(horizontal: 8)),
            CanvasWrapper(
                child: SectionService(),
                padding: EdgeInsets.symmetric(horizontal: 8)),
          ],
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
