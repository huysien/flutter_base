enum CacheExceptionType {
  notFound,
  writeFailure,
  readFailure,
  expired,
  unknown;

  String get message {
    switch (this) {
      case CacheExceptionType.notFound:
        return 'Data not found';
      case CacheExceptionType.writeFailure:
        return 'Failed to write data';
      case CacheExceptionType.readFailure:
        return 'Failed to read data';
      case CacheExceptionType.expired:
        return 'Data has expired';
      case CacheExceptionType.unknown:
        return 'Unknown error';
    }
  }
}

class CacheException implements Exception {
  CacheException({required this.type, this.originalException});

  final CacheExceptionType type;
  final Exception? originalException;

  @override
  String toString() => type == CacheExceptionType.unknown
      ? '${type.message}: ${originalException.toString()}'
      : type.message;
}
