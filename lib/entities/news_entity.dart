import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final String uid;
  final String author;
  final String description;
  final Timestamp createdAt;
  final String? imageURL;
  final List<dynamic> bookmarks;
  final List<dynamic> likes;

  const NewsEntity({
    required this.uid,
    required this.author,
    required this.description,
    required this.createdAt,
    required this.imageURL,
    required this.bookmarks,
    required this.likes,
  });

  Map<String, Object?> toDocument() {
    return {
      "uid": uid,
      "author": author,
      "description": description,
      "createdAt": createdAt,
      "imageURL": imageURL,
      "bookmarks": bookmarks,
      "likes": likes,
    };
  }

  Map<String, Object?> toDocumentWithoutUid() {
    return {
      "author": description,
      "description": description,
      "createdAt": createdAt,
      "imageURL": imageURL,
      "bookmarks": bookmarks,
      "likes": likes,
    };
  }

  static NewsEntity fromDocument(Map<String, Object?> doc, String uid) {
    return NewsEntity(
      uid: uid,
      author: doc['author'] as String,
      description: doc['description'] as String,
      createdAt: doc['createdAt'] as Timestamp,
      imageURL: doc['imageURL'] as String?,
      bookmarks: doc['bookmarks'] as List<dynamic>,
      likes: doc['likes'] as List<dynamic>,
    );
  }

  @override
  List<Object?> get props => [author, description, createdAt, imageURL, bookmarks, likes];
}