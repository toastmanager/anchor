import 'package:anchor/entities/my_user_entity.dart';
import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  final String uid;
  final String email;
  final String role;
  final String fullname;
  final String? picture;
  final int scores;
  final int earnedScores;

  const MyUser({
    required this.uid,
    required this.email,
    required this.role,
    required this.fullname,
    required this.picture,
    required this.scores,
    required this.earnedScores,
  });

  static const MyUser empty = MyUser(
    uid: '',
    email: '',
    role: '',
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
    int? scores,
    int? earnedScores,
  }) {
    return MyUser(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      role: role ?? this.role,
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
      scores: entity.scores, 
      earnedScores: entity.earnedScores,
    );
  }

  @override
  List<Object?> get props => [uid, email, fullname, picture];
}
