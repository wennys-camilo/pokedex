import '../../../../shared/helpers/failure.dart';
import 'package:dio/dio.dart';

abstract class RemoteDatasource {
  const RemoteDatasource();

  D? handleResponse<D>(Response response) {
    if (!(response.statusCode == 200 || response.statusCode == 204)) {
      throw ServerError.fromMap(
          map: response.data,
          stackTrace: StackTrace.current,
          statusCode: response.statusCode!);
    } else if (response.statusCode == 204) {
      return null;
    }
    return response.data;
  }
}
