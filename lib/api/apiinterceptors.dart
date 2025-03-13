import 'package:dio/dio.dart';
class AppInterceptor {
  var dio = Dio();

  // static String baseUrl = "https://dapi.carvia.tech/finch-service";

  AppInterceptor() {
    // dio.options = BaseOptions(contentType: 'application/json', baseUrl: baseUrl);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print("Request****888: ${options.method} ${options.uri}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print("Response******: ${response.statusCode} ${response.data}");
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        print("Error: ${e.response?.statusCode} ${e.message}");
        return handler.next(e);
      },
    ));
  }
}