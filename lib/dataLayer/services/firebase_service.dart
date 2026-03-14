import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> registerUser(
      String email, String password) async {

    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}