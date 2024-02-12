import 'package:anchor/entities/my_user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  final String uid;
  final String email;
  final String role;
  final String fullname;
  final String? picture;
  final Timestamp birthDate;
  final int scores;
  final int earnedScores;

  const MyUser({
    required this.uid,
    required this.email,
    required this.role,
    required this.fullname,
    required this.picture,
    required this.birthDate,
    required this.scores,
    required this.earnedScores,
  });

  static MyUser empty = MyUser(
    uid: '',
    email: '',
    role: '',
    birthDate: Timestamp(0,0),
    fullname: '',
    picture: '',
    scores: 0,
    earnedScores: 0,
  );

  MyUser copyWith({
    String? uid,
    String? email,
    String? role,
    String? fullname,
    String? picture,
    Timestamp? birthDate,
    int? scores,
    int? earnedScores,
  }) {
    return MyUser(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      role: role ?? this.role,
      birthDate: birthDate ?? this.birthDate,
      fullname: fullname ?? this.fullname,
      picture: picture ?? this.picture,
      scores: scores ?? this.scores,
      earnedScores: earnedScores ?? this.earnedScores,
    );
  }

  bool get isEmpty => this == MyUser.empty;
  bool get isNotEmpty => this != MyUser.empty;

  MyUserEntity toEntity() {
    return MyUserEntity(
      uid: uid,
      email: email,
      role: role,
      fullname: fullname,
      picture: picture,
      birthDate: birthDate,
      scores: scores, 
      earnedScores: earnedScores,
    );
  }

  MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      uid: entity.uid,
      email: entity.email,
      role: entity.role,
      fullname: entity.fullname,
      picture: entity.picture,
      birthDate: entity.birthDate,
      scores: entity.scores, 
      earnedScores: entity.earnedScores,
    );
  }

  @override
  List<Object?> get props => [uid, email, role, fullname, picture, birthDate, scores, earnedScores];
}
