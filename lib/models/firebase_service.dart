import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'car.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Auth methods
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  User? get currentUser => _auth.currentUser;

  // Car CRUD
  CollectionReference get carsCollection => _firestore.collection('cars');

  Future<void> addCar(Car car) async {
    await carsCollection.add({
      ...car.toMap(),
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<List<Car>> getCars() async {
    QuerySnapshot snapshot = await carsCollection.get();
    return snapshot.docs
        .map((doc) =>
            Car.fromMap(doc.data() as Map<String, dynamic>, id: doc.id))
        .toList();
  }

  Future<void> updateCar(String id, Car car) async {
    await carsCollection.doc(id).update(car.toMap());
  }

  Future<void> deleteCar(String id) async {
    await carsCollection.doc(id).delete();
  }
}
