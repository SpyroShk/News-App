import 'package:flutter/cupertino.dart';
import 'package:fw_news/models/news.dart';
import 'package:fw_news/services/news_service.dart';

class HeadlineProvider extends ChangeNotifier {
  late NewsService _newsService;

  HeadlineProvider({required NewsService newsService}) {
    _newsService = newsService;
  }
  List<News> _hnewss = [];
  bool _isLoading = true;

  List<News> get hnewss => _hnewss;
  bool get isLoading => _isLoading;

  void loadHeadline() async {
    _isLoading = true;
    notifyListeners();
    _hnewss = await _newsService.getNewss(isEverything: false);
    _isLoading = false;
    notifyListeners();
  }
}
