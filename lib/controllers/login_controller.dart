import '../models/firebase_service.dart';

class LoginController {
  final FirebaseService _firebaseService = FirebaseService();

  Future<void> login(String email, String password) async {
    await _firebaseService.signIn(email, password);
  }
}
