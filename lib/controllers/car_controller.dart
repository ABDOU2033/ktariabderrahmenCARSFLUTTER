import '../models/firebase_service.dart';
import '../models/car.dart';

class CarController {
  final FirebaseService _firebaseService = FirebaseService();

  Future<void> addCar(Car car) async {
    await _firebaseService.addCar(car);
  }

  Future<List<Car>> getCars() async {
    return await _firebaseService.getCars();
  }

  Future<void> updateCar(String id, Car car) async {
    await _firebaseService.updateCar(id, car);
  }

  Future<void> deleteCar(String id) async {
    await _firebaseService.deleteCar(id);
  }
}
