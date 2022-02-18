abstract class Failure {
  final String message;
  final StackTrace stackTrace;

  const Failure(this.message, this.stackTrace);
}

class DatasourceError extends Failure {
  DatasourceError({required String message, required StackTrace stackTrace})
      : super(message, stackTrace);
}

class RepositoryError extends Failure {
  RepositoryError({required String message, required StackTrace stackTrace})
      : super(message, stackTrace);
}

class ServerError extends Failure {
  final int statusCode;

  ServerError(
      {required String message,
      required StackTrace stackTrace,
      required this.statusCode})
      : super(message, stackTrace);

  ServerError.generic({required StackTrace stackTrace})
      : statusCode = 500,
        super('O servidor encontrou um erro ao processar a solicitação.',
            stackTrace);

  factory ServerError.fromMap(
      {required Map<String, dynamic> map,
      required int statusCode,
      required StackTrace stackTrace}) {
    return ServerError(
        message: map['message'] ??
            'O servidor encontrou um erro ao processar a solicitação.',
        stackTrace: stackTrace,
        statusCode: statusCode);
  }
}
