import 'dart:developer';
import 'package:firebase_storage/firebase_storage.dart';

class ScheduleService {
  final _storageRef = FirebaseStorage.instance.ref();

  Future<List<String>> getSunsScedule() async  {
    try {
      return [
        await _storageRef.child("/schedule/suns/monday.jpeg").getDownloadURL(),
        await _storageRef.child("/schedule/suns/tuesday.jpeg").getDownloadURL(),
        await _storageRef.child("/schedule/suns/wednesday.jpeg").getDownloadURL(),
        await _storageRef.child("/schedule/suns/thursday.jpeg").getDownloadURL(),
        await _storageRef.child("/schedule/suns/friday.jpeg").getDownloadURL(),
        await _storageRef.child("/schedule/suns/saturday.jpeg").getDownloadURL(),
      ];
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}