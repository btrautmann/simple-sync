import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Log {
  static final Logger _logger = Logger(printer: SimplePrinter());
  static Level logLevel = Level.verbose;

  static void debug(
    String message, {
    Map<String, dynamic>? properties,
  }) {
    _log(Level.debug, message, properties: properties);
  }

  static void info(
    String message, {
    Map<String, dynamic>? properties,
  }) {
    _log(Level.info, message, properties: properties);
  }

  static void warning(
    String message, {
    dynamic error,
    StackTrace? stackTrace,
    Map<String, dynamic>? properties,
  }) {
    _log(Level.warning, message, error: error, stackTrace: stackTrace, properties: properties);
  }

  static void error(
    String message, {
    dynamic error,
    StackTrace? stackTrace,
    Map<String, dynamic>? properties,
  }) {
    _log(Level.error, message, error: error, stackTrace: stackTrace, properties: properties);
  }

  static void _log(
    Level level,
    String message, {
    dynamic error,
    StackTrace? stackTrace,
    Map<String, dynamic>? properties,
  }) {
    if (level.index >= logLevel.index) {
      final formattedMessage = properties == null ? message : '$message - properties: $properties';
      _logger.log(
        level,
        formattedMessage,
        error,
        stackTrace,
      );
      if (kReleaseMode) {
        FirebaseCrashlytics.instance.log(formattedMessage);
      }
    }
  }
}
