import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<UserCredential> registerUser(
      String email, String password) async {

    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

   Future<List<Map<String, dynamic>>> fetchProducts() async {
    final snapshot = await _firestore.collection('products').get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}