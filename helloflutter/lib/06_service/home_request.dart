
import 'package:helloflutter/06_service/http_request.dart';
import 'package:dio/dio.dart';
import 'package:helloflutter/07_douban/model/home_model.dart';

class HomeReqest {
  static Future<List<MovieItem>> requestMoviesList(int start) async {
    // https://frodo.douban.com/api/v2/subject_collection/movie_hot_gaia/items?start=NaN&count=20&apiKey=0ac44ae016490db2204ce0a042db2916
    // https://httpbin.org/get
    const url = "https://frodo.douban.com/api/v2/subject_collection/movie_hot_gaia/items?start=NaN&count=20&apiKey=0ac44ae016490db2204ce0a042db2916";

    final result = await HttpRequest.request(url, method: "get");
    final subjects = result['subject_collection_items'];
    
    List<MovieItem> movies = [];
    for (var sub in subjects) {
      movies.add(MovieItem.fromJson(sub));
    }
    return movies;
  }
}