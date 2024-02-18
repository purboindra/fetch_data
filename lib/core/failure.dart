class Failure {
  final String message;
  final StackTrace stackTrace;

  Failure(
    this.message,
    this.stackTrace,
  );
}

class CustomError {
  final String message;

  CustomError(this.message);
}
