import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:retrofit/retrofit.dart';

import 'file_log_output.dart';

class NetworkParseErrorLogger implements ParseErrorLogger {
  final Logger _logger = Logger(
      output: MultiOutput([
    ConsoleOutput(),
    FileLogOutput("network_parse_error_log.txt"),
  ]));

  @override
  void logError(Object error, StackTrace stackTrace, RequestOptions options) {
    _logger.e("NetworkParseError: $error",
        error: error, stackTrace: stackTrace);
  }
}
