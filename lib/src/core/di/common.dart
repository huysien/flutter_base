import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../common/network_parse_error_logger.dart';

part 'common.g.dart';

@riverpod
NetworkParseErrorLogger networkParseErrorLogger(Ref ref) =>
    NetworkParseErrorLogger();
