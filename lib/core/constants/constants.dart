import 'package:flutter_dotenv/flutter_dotenv.dart';

class Const {
  static final apiUrl = dotenv.env['API_URL'] as String;
  static final anonKey = dotenv.env['ANON_KEY'] as String;
}