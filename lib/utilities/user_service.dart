import 'dart:developer';
import 'package:anchor/models/my_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getFirstFifteenLeaders() {
    return _db
      .collection('users')
      .orderBy('earnedScores', descending: true)
      .limit(15)
      .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getModerators() {
    return _db
      .collection('users')
      .where('role', isEqualTo: 'moderator')
      .snapshots();
  }

  Future<MyUser?> getCurrentUser() async {
    final User? user = _auth.currentUser;
    if (user == null) {
      return null;
    }
    try {
      // TODO: use userDataStream instead of simple userData
      // final userDataStream = _db.collection('users').doc(user.uid).snapshots();
      final userData = await _db
        .collection('users')
        .doc(user.uid)
        .get();
      
      return MyUser(
        uid: user.uid,
        email: user.email!,
        role: userData['role'] as String,
        fullname: userData['fullname'] as String,
        picture: userData['picture'] as String?,
        birthDate: userData['birthDate'] as Timestamp,
        scores: userData['scores'] as int,
        earnedScores: userData['earnedScores'] as int,
      );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<MyUser?> getUserByUid(String uid) async {
    try {
      // TODO: use userDataStream instead of simple userData
      // final userDataStream = _db.collection('users').doc(user.uid).snapshots();
      final userData = await _db
        .collection('users')
        .doc(uid)
        .get();
      
      return MyUser(
        uid: uid,
        email: '',
        role: userData['role'] as String,
        fullname: userData['fullname'] as String,
        picture: userData['picture'] as String?,
        birthDate: userData['birthDate'] as Timestamp,
        scores: userData['scores'] as int,
        earnedScores: userData['earnedScores'] as int,
      );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  
  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> signUp(String email, String password, String fullname, Timestamp birthDate) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      try {
        await _db
          .collection("users")
          .doc(userCredential.user?.uid)
          .set({
            'role': "regular",
            'fullname': fullname,
            'picture': null,
            'birthDate': birthDate,
            'scores': 0,
            'earnedScores': 0,
          });
      } catch (e) {
        await userCredential.user?.delete();
        rethrow;
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> deleteAccount() async {
    try {
      User? user = _auth.currentUser;
      await _db
        .collection('users')
        .doc(user?.uid)
        .delete();
      await user?.delete();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> updateUserInfo({
    String? fullname,
    String? email,
    String? picture,
    Timestamp? birthDate,
  }) async {
    try {
      User? user = _auth.currentUser;
      final userRef = _db
        .collection('users')
        .doc(user?.uid);
      final userInfo = await userRef.get();
      await userRef.update({
        'fullname': fullname ?? userInfo['fullname'],
        'email': email ?? userInfo['email'],
        'picture': picture ?? userInfo['picture'],
        'birthDate': birthDate ?? userInfo['birthDate'],
      });
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}