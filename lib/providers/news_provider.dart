import 'package:flutter/cupertino.dart';
import 'package:fw_news/models/news.dart';
import 'package:fw_news/services/news_service.dart';

class NewsProvider extends ChangeNotifier {
  late NewsService _newsService;

  NewsProvider({required NewsService newsService}) {
    _newsService = newsService;
  }
  List<News> _newss = [];
  bool _isLoading = true;

  List<News> get newss => _newss;
  bool get isLoading => _isLoading;

  void loadEverything() async {
    _isLoading = true;
    notifyListeners();
    _newss = await _newsService.getNewss(isEverything: true);
    _isLoading = false;
    notifyListeners();
  }
}
