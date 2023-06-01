import 'dart:convert';
import 'package:fw_news/services/constant.dart';
import 'package:fw_news/models/news.dart';
import 'package:http/http.dart' as http;

class NewsService {
    Future<List<News>> getNewss({required bool isEverything}) async {
    List<News> hnewss = [];
    String url1 = "${ApiConstant.baseUrl1}&apiKey=${ApiConstant.apiKey}";
    String url2 = "${ApiConstant.baseUrl2}&apiKey=${ApiConstant.apiKey}";

    try {
      final everything = await http.get(Uri.parse(url1));
      final headline = await http.get(Uri.parse(url2));

      final url = isEverything ? everything : headline;
      final response = url;
      final apiData = jsonDecode(response.body);
      // log(apiData['articles'].toString());

      for (final item in apiData['articles']) {
        // News news = News.fromJson(item);
        // newss.add(news);
        News hnews = News.fromJson(item);
        hnewss.add(hnews);
      }
      return hnewss;
    } catch (e) {
      // log(e.toString());
      return hnewss;
    }
  }
}
