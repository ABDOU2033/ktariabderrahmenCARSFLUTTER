import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'crud_page.dart';
import 'favorites_page.dart';
import 'list_page.dart';
import 'price_page.dart';
import 'tel_page.dart';
import 'catalogue_page.dart';

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cars App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red, useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (_) => const LoginPage(),
        '/home': (_) => const PageAccueil(),
        '/crud': (_) => const CrudPage(),
        '/favoris': (_) => const PageFavorisVoitures(),
        '/liste': (_) => const PageListeVoitures(),
        '/prix': (_) => const PagePrixVoitures(),
        '/tel': (_) => const PageTel(),
        '/catalogue': (_) => const PageCatalogueCategories(),
      },
    );
  }
}
