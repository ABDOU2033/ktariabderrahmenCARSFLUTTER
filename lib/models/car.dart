class Car {
  final String? id;
  final String name;
  final String? price;
  final String? image;
  final String? marque;
  final String? modele;
  final int? annee;

  Car({
    this.id,
    required this.name,
    this.price,
    this.image,
    this.marque,
    this.modele,
    this.annee,
  });

  factory Car.fromMap(Map<String, dynamic> map, {String? id}) {
    return Car(
      id: id,
      name: map['name'] ?? '',
      price: map['prix'],
      image: map['image'],
      marque: map['marque'],
      modele: map['modele'],
      annee: map['annee'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'prix': price,
      'image': image,
      'marque': marque,
      'modele': modele,
      'annee': annee,
    };
  }
}
