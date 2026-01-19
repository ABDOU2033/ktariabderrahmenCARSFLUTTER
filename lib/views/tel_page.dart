import 'package:flutter/material.dart';

class PageTel extends StatelessWidget {
  const PageTel({super.key});

  static const List<Map<String, String>> contacts = [
    {"nom": "Service Client", "tel": "+216 23 45 67 89"},
    {"nom": "Assistance Technique", "tel": "+216 22 34 56 78"},
    {"nom": "Ventes", "tel": "+216 99 01 23 45"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Contacts"), backgroundColor: Colors.red),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final c = contacts[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Card(
              elevation: 6,
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                leading: const Icon(Icons.call, color: Colors.red, size: 32),
                title: Text(c["nom"]!,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                subtitle: Text(c["tel"]!,
                    style:
                        const TextStyle(fontSize: 15, color: Colors.black87)),
                trailing: const Icon(Icons.phone_in_talk,
                    color: Colors.green, size: 30),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Appel à ${c["tel"]}")));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
