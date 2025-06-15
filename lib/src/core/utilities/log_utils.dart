import 'package:logger/web.dart';

import '../common/file_log_output.dart';

final _logger = Logger(
    output: MultiOutput([
  ConsoleOutput(),
  FileLogOutput("log.txt"),
]));

void logError(dynamic error, {StackTrace? stackTrace}) {
  _logger.e(
    "AppError: $error",
    time: DateTime.now(),
    error: error,
    stackTrace: stackTrace,
  );
}

void logInfo(dynamic info, {DateTime? time, StackTrace? stackTrace}) {
  _logger.i(
    "AppInfo: $info",
    time: DateTime.now(),
    stackTrace: stackTrace,
  );
}
