import 'package:dio/dio.dart';

class HttpRequest {
  Dio _dio = new Dio();
  final baseurl =
      "https://startupify-sample-apis.herokuapp.com/products?start=0&rows=100&category=";
  // add category to this

  HttpRequest() {
    _dio = Dio(BaseOptions(
      baseUrl: baseurl,
    ));

    initializeInterceptor();
  }

  Future<Response> getRequest(String endpoint) async {
    Response response;
    try {
      response = await _dio.get(endpoint);
    } on DioError catch (error) {
      print(error.message);
      throw Exception(error.message);
    }
    return response;
  }

  initializeInterceptor() {
    _dio.interceptors.add(InterceptorsWrapper(
        onError: (DioError err, ErrorInterceptorHandler handler) => {
              // print(error.message);
              print(err.message)
            },
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          print("${options.method} ${options.path}");
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          print(response.data);
        }));
  }
}
