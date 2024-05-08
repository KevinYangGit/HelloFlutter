
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio/dio.dart';

/*
https://frodo.douban.com/api/v2/subject_collection/movie_hot_gaia/items?start=NaN&count=20&apiKey=0ac44ae016490db2204ce0a042db2916
*/

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(baseUrl: "https://frodo.douban.com", connectTimeout: Duration(seconds: 30), headers: {"Accept": "application/json"});
  static final dio = Dio(baseOptions);

  static Future<T> request<T>(String url, { String? method, Map<String, dynamic>? params, Interceptor? interceptor }) async {
    initAdapter();
    Options options = Options(method: method);
    
    // 全局拦截器
    Interceptor dInter = InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        print("请求拦截");
        // 如果你想完成请求并返回一些自定义数据，你可以使用 `handler.resolve(response)`。
        // 如果你想终止请求并触发一个错误，你可以使用 `handler.reject(error)`。
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        print("响应拦截");
        // 如果你想终止请求并触发一个错误，你可以使用 `handler.reject(error)`。
        return handler.next(response);
      },
      onError: (DioException error, ErrorInterceptorHandler handler) {
        print("错误拦截");
        // 如果你想完成请求并返回一些自定义数据，你可以使用 `handler.resolve(response)`。
        return handler.next(error);
      }
    );
    List<Interceptor> list = [dInter];
    if (interceptor != null) {
      list.add(interceptor);
    }
    dio.interceptors.addAll(list);

    // 发起请求
    print("发起请求");
    try {
      Response response = await dio.request(url, queryParameters: params, options: options);
      print("------- SUCCESS -------\n$response");
      print("------- SUCCESS -------\n");
      return response.data;
    } catch(e) {
      print("------- ERROR -------\n$e");
      print("------- ERROR -------\n");
      return Future.error(e);
    }                         
  }

  static initAdapter() {
    dio.httpClientAdapter = IOHttpClientAdapter()..onHttpClientCreate = (client) {
      // Config the client.
      client.findProxy = (uri) {
        // Forward all request to proxy "localhost:8888".
        return 'PROXY 172.24.2.24:8888';
      };
      // You can also create a new HttpClient for Dio instead of returning,
      // but a client must being returned here.
      return client;
    };
  }

  static final testDio = Dio();

  static Future<T> getHttp<T>(String url) async {
    final response = await testDio.get(url);
    print('------ $response');
    return response.data;
  }
}

