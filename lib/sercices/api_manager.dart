import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/newsinfo.dart';

class API_Manager {
  Future<NewsModel?> getNews() async {
    var client = http.Client();
    var newsModel = null;
    try {
      var response = await http.get(Uri.parse(
          'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=1fdf788228d441b7b2bc26c28b16e8b0'));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        var newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }
  }
}
