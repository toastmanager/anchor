import 'dart:developer';

import 'package:anchor/entities/news_entity.dart';
import 'package:anchor/models/news_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewsService {
  final _db = FirebaseFirestore.instance;

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

}