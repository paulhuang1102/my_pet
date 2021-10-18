import 'package:logger/logger.dart';

class Log {
  static final Log _instance = Log._internal();
  factory Log() => _instance;

  static final Logger _stackLogger = Logger(
    printer: PrettyPrinter(errorMethodCount: 8, stackTraceBeginIndex: 1),
  );
  static final Logger _noStacklogger = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  Log._internal();

  static void verbose(dynamic message) {
    _noStacklogger.v(message);
  }

  static void debug(dynamic message) {
    _noStacklogger.d(message);
  }

  static void info(dynamic message) {
    _noStacklogger.i(message);
  }

  static void waring(dynamic message) {
    _stackLogger.w(message);
  }

  static void error(dynamic message) {
    _stackLogger.e(message);
  }
}
