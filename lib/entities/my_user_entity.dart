import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String uid;
  final String email;
  final String role;
  final String fullname;
  final String? picture;
  final int scores;
  final int earnedScores;

  const MyUserEntity ({
    required this.uid,
    required this.email,
    required this.role,
    required this.fullname,
    required this.picture,
    required this.scores,
    required this.earnedScores,
  });

  Map<String, Object?> toDocument() {
    return {
      "uid": uid,
      "email": email,
      "fullname": fullname,
      "picture": picture,
      "scores": scores,
      "earnedScores": earnedScores,
    };
  }

  static MyUserEntity fromDocument(Map<String, Object?> doc) {
    return MyUserEntity(
      uid: doc['uid'] as String,
      email: doc['email'] as String,
      role: doc['role'] as String,
      fullname: doc['fullname'] as String,
      picture: doc['picture'] as String?,
      scores: doc['scores'] as int,
      earnedScores: doc['earnedScores'] as int,
    );
  }

  @override
  List<Object?> get props => [uid, email, fullname, picture];
}