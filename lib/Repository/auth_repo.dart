import 'package:firebase_auth/firebase_auth.dart';
import 'package:sss_stars_flutter_assessment/dataLayer/services/firebase_service.dart';
import 'package:sss_stars_flutter_assessment/mvvm/models/auth_result.dart';

class AuthRepo {
  AuthRepo._();
  static final AuthRepo instance = AuthRepo._();
  final FirebaseService _firebaseService = FirebaseService();

  Future<AuthResult> registerUser(String email, String password) async {
    try {
      await _firebaseService.registerUser(email, password);

      return AuthResult(success: true, message: "Account created successfully");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return AuthResult(
            success: false,
            message: "Email already registered",
          );

        case 'invalid-email':
          return AuthResult(success: false, message: "Invalid email format");

        case 'weak-password':
          return AuthResult(success: false, message: "Password is too weak");

        default:
          return AuthResult(
            success: false,
            message: e.message ?? "Authentication error",
          );
      }
    } catch (e) {
      return AuthResult(success: false, message: "Something went wrong");
    }
  }
}
