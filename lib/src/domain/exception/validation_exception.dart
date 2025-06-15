class ValidationException implements Exception {
  ValidationException({required this.message});

  final String message;

  @override
  String toString() => 'ValidationException: $message';
}
