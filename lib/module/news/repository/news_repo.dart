import 'package:app_ban_giay/module/news/model/news_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getNewsProvider = FutureProvider<List<NewsModel>>((ref) async {
  final db = FirebaseFirestore.instance;
  var listNews = <NewsModel>[];
  await db.collection('news').limit(4).get().then((value) {
    if (value.docs.isNotEmpty) {
      for (var element in value.docs) {
        listNews.add(NewsModel(
            name: element.data()['name'],
            description: element.data()['description'],
            content: element.data()['content'],
            photo: element.data()['photo']));
      }
    }
  });
  return listNews;
});

final getNewsCategoryProvider = FutureProvider<List<NewsModel>>((ref) async {
  final db = FirebaseFirestore.instance;
  var listNews = <NewsModel>[];
  await db.collection('news').get().then((value) {
    if (value.docs.isNotEmpty) {
      for (var element in value.docs) {
        listNews.add(NewsModel(
            name: element.data()['name'],
            description: element.data()['description'],
            content: element.data()['content'],
            photo: element.data()['photo']));
      }
    }
  });
  return listNews;
});
