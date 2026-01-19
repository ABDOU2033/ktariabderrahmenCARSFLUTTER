import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.red),
            child: Text("Cars App",
                style: TextStyle(color: Colors.white, fontSize: 22)),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Accueil"),
            onTap: () => Navigator.pushReplacementNamed(context, '/home'),
          ),
          ListTile(
            leading: const Icon(Icons.car_repair),
            title: const Text("CRUD Voitures"),
            onTap: () => Navigator.pushNamed(context, '/crud'),
          ),
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text("Catalogue Arrivage"),
            onTap: () => Navigator.pushNamed(context, '/catalogue'),
          ),
          ListTile(
            leading: const Icon(Icons.price_check),
            title: const Text("Prix des Voitures"),
            onTap: () => Navigator.pushNamed(context, '/prix'),
          ),
          ListTile(
            leading: const Icon(Icons.directions_car),
            title: const Text("Liste des Voitures"),
            onTap: () => Navigator.pushNamed(context, '/liste'),
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text("Contacts / Tel"),
            onTap: () => Navigator.pushNamed(context, '/tel'),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text("Favoris"),
            onTap: () => Navigator.pushNamed(context, '/favoris'),
          ),
        ],
      ),
    );
  }
}
