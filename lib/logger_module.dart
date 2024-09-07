import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class LoggerModule {
  @LazySingleton()
  Logger get logger => Logger();
}