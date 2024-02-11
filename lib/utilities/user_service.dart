import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }
  
  Future<void> logOut() async {
    await _auth.signOut();
  }

  Future<void> signUp(String email, String password, String fullname) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    _db
      .collection("users")
      .doc(userCredential.user?.uid)
      .set({
        'role': "regular",
        'fullname': fullname,
        'picture': null,
        'scores': 0,
        'earnedScores': 0,
      });
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}