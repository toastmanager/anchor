import 'dart:developer';
import 'dart:io';

import 'package:anchor/entities/news_entity.dart';
import 'package:anchor/models/news_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class NewsService {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  final _storageRef = FirebaseStorage.instance.ref();

  late final CollectionReference _newsRef;

  NewsService() {
    _newsRef = _db
      .collection('news')
      .withConverter<News>(
        fromFirestore: (snapshot, _) => News.fromEntity(
          NewsEntity.fromDocument(snapshot.data()!, snapshot.id)
        ),
        toFirestore: (event, _) => News
          .toEntity(event)
          .toDocument(),
      );
  }

  Stream<QuerySnapshot> getNews() {
    try {
      return _newsRef
        .orderBy('createdAt', descending: true)
        .snapshots();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> setLike(String newsUID) async {
    try {
      User? user = _auth.currentUser;
      await _newsRef
        .doc(newsUID)
        .update({
          'likes': FieldValue.arrayUnion([user?.uid]),
        });
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> unSetLike(String newsUID) async {
    try {
      User? user = _auth.currentUser;
      await _newsRef
        .doc(newsUID)
        .update({
          'likes': FieldValue.arrayRemove([user?.uid]),
        });
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> createNews(News news, XFile? image, String userUID) async {
    String? newsId;
    bool isFilePutted = false;
    bool eventCreated = false;
    String? fileName;
    
    try {
      if (image != null) {
        fileName = image.path.split("/").last;
        final uploadRef = _storageRef.child("news/$userUID/$fileName");
        await uploadRef.putFile(File(image.path));
        isFilePutted = true;
        
        news = news.copyWith(
          uid: newsId,
          imageURL: await uploadRef.getDownloadURL()
        );
      }


      await _db
        .collection('news')
        .doc(newsId)
        .set(News.toEntity(news).toDocumentWithoutUid());
      eventCreated = true;
    } catch (e) {
      if (eventCreated) {
        _db.collection('news').doc(newsId).delete();
      }
      if (isFilePutted) {
        _storageRef.child("news/$userUID/$fileName").delete();
      }

      log(e.toString());
      rethrow;
    }
  }
}