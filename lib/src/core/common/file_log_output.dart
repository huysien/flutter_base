import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class FileLogOutput extends LogOutput {
  FileLogOutput(this.fileName);

  final String fileName;

  @override
  void output(OutputEvent event) => _writeEvent(event);

  Future<void> _writeEvent(OutputEvent event) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$fileName');
      for (var line in event.lines) {
        file.writeAsStringSync('[${event.origin.time}] $line\n',
            mode: FileMode.append);
      }
    } on Exception catch (e) {
      debugPrint('FileLogOutputError $fileName: $e');
    }
  }
}
