import 'package:anchor/entities/news_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class News extends Equatable {
  final String uid;
  final String author;
  final String description;
  final Timestamp createdAt;
  final String? imageURL;
  final List<dynamic> bookmarks;
  final List<dynamic> likes;

  const News({
    required this.uid,
    required this.author,
    required this.description,
    required this.createdAt,
    required this.imageURL,
    required this.bookmarks,
    required this.likes,
  });

  static News empty = News(
    uid: '',
    author: '',
    description: '',
    createdAt: Timestamp(0, 0),
    imageURL: null,
    bookmarks: const [],
    likes: const [],
  );

  News copyWith({
    String? uid,
    String? author,
    String? description,
    Timestamp? createdAt,
    String? imageURL,
    List<String>? bookmarks,
    List<String>? likes,
  }) {
    return News(
      uid: uid ?? this.uid,
      author: author ?? this.author,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      imageURL: imageURL ?? this.imageURL,
      bookmarks: bookmarks ?? this.bookmarks,
      likes: likes ?? this.likes,
    );
  }

  bool get isEmpty => this == News.empty;
  bool get isNotEmpty => this != News.empty;

  static NewsEntity toEntity(News model) {
    return NewsEntity(
      uid: model.uid,
      author: model.author,
      description: model.description,
      createdAt: model.createdAt,
      imageURL: model.imageURL,
      bookmarks: model.bookmarks,
      likes: model.likes,
    );
  }

  static News fromEntity(NewsEntity entity) {
    return News(
      uid: entity.uid,
      author: entity.author,
      description: entity.description,
      createdAt: entity.createdAt,
      imageURL: entity.imageURL,
      bookmarks: entity.bookmarks,
      likes: entity.likes,
    );
  }

  @override
  List<Object?> get props => [author, description, createdAt, imageURL, bookmarks, likes];
}