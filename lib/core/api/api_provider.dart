import '../core_importer.dart';

class ApiProvider {
  static Future<Response?> sendRequest(
      {required String url, dynamic body, Map<String, dynamic>? queryParameters, required HttpMethods method}) async {
    var options = BaseOptions(
        baseUrl: 'https://pokeapi.co',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        contentType: Headers.jsonContentType);

    var dio = Dio(options);

    Response response;
    try {
      switch (method) {
        case HttpMethods.get:
          response = await dio.get(url, queryParameters: queryParameters);
          break;

        case HttpMethods.delete:
          response = await dio.delete(url, queryParameters: queryParameters);
          break;
        case HttpMethods.put:
          response = await dio.put(url, queryParameters: queryParameters, data: body);
          break;
        case HttpMethods.post:
          response = await dio.post(url,
              queryParameters: queryParameters,
              options: Options(validateStatus: (status) => status! < internalServerError),
              data: body);
          break;
      }
    } on DioException catch (e) {
      return ErrorHandler.handleDioError(e, RequestOptions(path: url));
    }

    return response;
  }
}

enum HttpMethods { get, post, put, delete }
