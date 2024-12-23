import 'package:dio/dio.dart';

import '../constants/app_url.dart';

class ApiService {
  static final _options = BaseOptions(
    baseUrl: AppUrl.baseUrl,
    connectTimeout: const Duration(seconds: AppUrl.connectionTimeout),
    receiveTimeout: const Duration(seconds: AppUrl.receiveTimeout),
    responseType: ResponseType.json,
  );

  // dio instance
  final Dio _dio = Dio(_options)..interceptors.add(LogInterceptor());

  // GET request
  Future<Response> get(
      String url, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}