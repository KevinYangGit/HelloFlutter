
import 'package:dio/dio.dart';

class HttpRequest {
  static Future<T> request<T>(String url, { String? method, Map<String, dynamic>? params, Interceptor? interceptor }) async {
    Options options = Options(method: method);
    final dio = Dio();

    // 全局拦截器
    Interceptor dInter = InterceptorsWrapper(
      onRequest: (options, handle) {
        print("请求拦截");
        return;
      },
      onResponse: (options, handle) {
        print("响应拦截");
        return;
      },
      onError: (options, handle) {
        print("错误拦截");
        return;
      }
    );
    List<Interceptor> list = [dInter];
    if (interceptor != null) {
      list.add(interceptor);
    }
    dio.interceptors.addAll(list);

    // 发起请求
    try {
      Response response = await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } catch(e) {
      return Future.error(e);
    }
  }
}