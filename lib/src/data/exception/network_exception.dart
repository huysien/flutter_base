import 'package:dio/dio.dart';

enum NetworkExceptionType {
  noInternet,
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  tooManyRequests,
  internalServerError,
  serviceUnavailable,
  timeout,
  invalidReponseFormat,
  unknown;

  String get message {
    switch (this) {
      case NetworkExceptionType.noInternet:
        return 'No internet connection';
      case NetworkExceptionType.badRequest:
        return 'Bad request';
      case NetworkExceptionType.unauthorized:
        return 'Unauthorized';
      case NetworkExceptionType.forbidden:
        return 'Forbidden';
      case NetworkExceptionType.notFound:
        return 'Not found';
      case NetworkExceptionType.tooManyRequests:
        return 'Too many requests';
      case NetworkExceptionType.internalServerError:
        return 'Internal server error';
      case NetworkExceptionType.serviceUnavailable:
        return 'Service unavailable';
      case NetworkExceptionType.timeout:
        return 'Timeout';
      case NetworkExceptionType.invalidReponseFormat:
        return 'Invalid response format';
      case NetworkExceptionType.unknown:
        return 'Unknown error';
    }
  }
}

class NetworkException implements Exception {
  NetworkException({required this.type, this.originalException});

  final NetworkExceptionType type;
  final Exception? originalException;

  @override
  String toString() => type == NetworkExceptionType.unknown
      ? '${type.message}: ${originalException.toString()}'
      : type.message;

  factory NetworkException.fromDioException(DioException exception) {
    NetworkExceptionType? type;
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        type = NetworkExceptionType.timeout;
        break;
      case DioExceptionType.connectionError:
        type = NetworkExceptionType.noInternet;
        break;
      case DioExceptionType.badResponse:
        type = exception.response?.statusCode?.mapToNetworkExceptionType();
        break;
      default:
        break;
    }
    type ??= NetworkExceptionType.unknown;
    return NetworkException(type: type, originalException: exception);
  }

  factory NetworkException.fromFormatException(FormatException exception) =>
      NetworkException(
        type: NetworkExceptionType.invalidReponseFormat,
        originalException: exception,
      );
}

extension StatusCodeExt on int {
  NetworkExceptionType mapToNetworkExceptionType() {
    switch (this) {
      case 400:
        return NetworkExceptionType.badRequest;
      case 401:
        return NetworkExceptionType.unauthorized;
      case 403:
        return NetworkExceptionType.forbidden;
      case 404:
        return NetworkExceptionType.notFound;
      case 429:
        return NetworkExceptionType.tooManyRequests;
      case 500:
        return NetworkExceptionType.internalServerError;
      case 502:
      case 503:
      case 504:
        return NetworkExceptionType.serviceUnavailable;
      default:
        return NetworkExceptionType.unknown;
    }
  }
}
