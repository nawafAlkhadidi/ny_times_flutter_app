// ignore_for_file: use_rethrow_when_possible
import 'package:dio/dio.dart';

import '../../library.dart';

class ApiBaseHelper {
  static final BaseOptions options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(minutes: 1),
    receiveTimeout: const Duration(minutes: 1),
    followRedirects: false,
    validateStatus: (status) => true,
  );

  final Dio _dio = Dio(options);

  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    queryParameters = {
      'api-key': apiKey,
    };
    try {
      Response response = await _dio.get(endpoint, queryParameters: queryParameters);
      return response;
    } catch (error) {
      if (kDebugMode) {
        print('Error occurred: $error');
      }
      throw error;
    }
  }
}
