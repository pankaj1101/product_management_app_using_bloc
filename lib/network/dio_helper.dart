import 'package:dio/dio.dart';

class DioHelper {
  Dio dio = getDio();

  Options options = Options(
    contentType: 'application/json',
    receiveDataWhenStatusError: true,
    validateStatus: (status) {
      return (status == 200);
    },
    sendTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  );

  // Method to set the Bearer token
  void setBearerToken() {
    dio.options.headers['Authorization'] = 'Bearer token';
  }

  Future<dynamic> get(
      {required String endPoint, bool isAuthenticateRequired = true}) async {
    if (isAuthenticateRequired) setBearerToken();
    try {
      final Response response = await dio.get(endPoint, options: options);
      return response.data;
    } on DioException catch (e) {
      // Log the error and return the error message
      print('Error occurred: ${e.response?.statusCode} ${e.message}');
      return e.message; // Return the error message
    }
  }

  Future<dynamic> post({required String endPoint, Object? requestBody}) async {
    try {
      Response response;
      if (requestBody == null) {
        response = await dio.post(endPoint, options: options);
      } else {
        response =
            await dio.post(endPoint, data: requestBody, options: options);
      }
      return response.data;
    } on DioException catch (e) {
      // Log the error and return the error message
      print('Error occurred: ${e.response?.statusCode} ${e.message}');
      return e.message; // Return the error message
    }
  }

  Future<dynamic> put({required String endPoint, Object? requestBody}) async {
    try {
      Response response;
      if (requestBody == null) {
        response = await dio.put(endPoint, options: options);
      } else {
        response = await dio.put(endPoint, data: requestBody, options: options);
      }
      return response.data;
    } on DioException catch (e) {
      print('Error occurred: ${e.response?.statusCode} ${e.message}');
      return e.message;
    }
  }

  Future<dynamic> delete({required String endPoint}) async {
    try {
      final Response response = await dio.delete(endPoint, options: options);
      return response.data;
    } on DioException catch (e) {
      print('Error occurred: ${e.response?.statusCode} ${e.message}');
      return e.message;
    }
  }

  Future<dynamic> patch({required String endPoint, Object? requestBody}) async {
    try {
      Response response;
      if (requestBody == null) {
        response = await dio.patch(endPoint, options: options);
      } else {
        response =
            await dio.patch(endPoint, data: requestBody, options: options);
      }
      return response.data;
    } on DioException catch (e) {
      print('Error occurred: ${e.response?.statusCode} ${e.message}');
      return e.message;
    }
  }
}

Dio getDio() {
  Dio dio = Dio();
  dio.options.baseUrl = 'https://dummyjson.com';

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      print('Request: ${options.method} ${options.path}');
      // Log the request headers
      print('Request Headers: ${options.headers}');  
      return handler.next(options);
    },
    onResponse: (response, handler) {
      print('Response: ${response.statusCode} ${response.data}');

      return handler.next(response);
    },
    onError: (DioException e, handler) {
      print('Error: $e');
      return handler.next(e);
    },
  ));

  return dio;
}
