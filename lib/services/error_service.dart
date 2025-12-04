import 'package:flutter/foundation.dart';

/// Professional error handling and logging service
/// Centralizes error management and provides debugging capabilities
class ErrorService {
  static bool _isDebugMode = kDebugMode;

  /// Log information messages
  static void logInfo(String message, [String? tag]) {
    if (_isDebugMode) {
      print('ℹ️ ${tag != null ? '[$tag] ' : ''}$message');
    }
  }

  /// Log warning messages
  static void logWarning(String message, [String? tag]) {
    if (_isDebugMode) {
      print('⚠️ ${tag != null ? '[$tag] ' : ''}$message');
    }
  }

  /// Log error messages with optional stack trace
  static void logError(String message,
      [Object? error, StackTrace? stackTrace, String? tag]) {
    if (_isDebugMode) {
      print('❌ ${tag != null ? '[$tag] ' : ''}$message');
      if (error != null) {
        print('   Error: $error');
      }
      if (stackTrace != null) {
        print('   Stack: $stackTrace');
      }
    }
  }

  /// Log success messages
  static void logSuccess(String message, [String? tag]) {
    if (_isDebugMode) {
      print('✅ ${tag != null ? '[$tag] ' : ''}$message');
    }
  }

  /// Handle Firebase-specific errors with user-friendly messages
  static String getFirebaseErrorMessage(Object error) {
    final errorString = error.toString().toLowerCase();

    if (errorString.contains('network')) {
      return 'Please check your internet connection';
    } else if (errorString.contains('permission')) {
      return 'Access denied. Please check your permissions';
    } else if (errorString.contains('not-found')) {
      return 'Requested data not found';
    } else if (errorString.contains('unavailable')) {
      return 'Service temporarily unavailable. Please try again later';
    } else {
      return 'An unexpected error occurred. Please try again';
    }
  }
}
