
import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:new_app/models/news.dart';

class NewsProvider extends ChangeNotifier {
  final List<News> bookmark = [];
  UnmodifiableListView<News> get news => UnmodifiableListView(bookmark);

  int get totalNews => bookmark.length;

  void addNews(News news) {
    bookmark.add(news);
    notifyListeners();
  }

  void removeNews(News news) {
    bookmark.remove(news);
    notifyListeners();
  }

  void removeAll() {
    bookmark.clear();
    notifyListeners();
  }

  String getLastNewsTitle() {
    if (bookmark.isEmpty) {
      return "";
    }
    return bookmark.last.title;
  }
}
