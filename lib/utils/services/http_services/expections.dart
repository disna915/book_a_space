class AppException implements Exception {
  final String? message;
  final String? prefix;
  final int? statusCode;

  AppException({this.message, this.prefix, this.statusCode});

  AppException toList() {
    return AppException(
        message: message, prefix: prefix, statusCode: statusCode);
  }
}

class FetchDataException extends AppException {
  FetchDataException([
    String? message,
    int? statusCode,
  ]) : super(
    message: message,
    prefix: "FetchDataException:",
    statusCode: statusCode,
  );
}

class BadRequestException extends AppException {
  BadRequestException([
    String? message,
    int? statusCode,
  ]) : super(
    message: message,
    prefix: "Invalid Request:",
    statusCode: statusCode,
  );
}

class UnauthorizedException extends AppException {
  UnauthorizedException([
    String? message,
    int? statusCode,
  ]) : super(
    message: message,
    prefix: "Unauthorized:",
    statusCode: statusCode,
  );
}

class InvalidInputException extends AppException {
  InvalidInputException([
    String? message,
    int? statusCode,
  ]) : super(
    message: message,
    prefix: "Invalid Input:",
    statusCode: statusCode,
  );
}

class NotFoundException extends AppException {
  NotFoundException([
    String? message,
    int? statusCode,
  ]) : super(
    message: message,
    prefix: "Not Found:",
    statusCode: statusCode,
  );
}

class InternalServerException extends AppException {
  InternalServerException([
    String? message,
    int? statusCode,
  ]) : super(
    message: message,
    prefix: "Internal Server Error:",
    statusCode: statusCode,
  );
}