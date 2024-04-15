
import 'dart:html';

class HomeReqest {
  static Future<List> requestMoviesList() async {
    final url = "";

    final response = await HttpRequest.request(url, method: "get");
    final subjects = response["subjects"];

    List list = [];
    for (var sub in subjects) {

    }
    return list;
  }
}