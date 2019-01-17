import 'dart:convert';

import 'package:hacker_news/data/model/ArticleEntity.dart';
import 'package:hacker_news/data/repository/ArticleRemote.dart';
import 'package:hacker_news/remote/mapper/ArticleRemoteMapper.dart';
import 'package:hacker_news/remote/model/RemoteArticle.dart';
import 'package:http/http.dart' as http;

/// Remote implementation for retrieving Articles instances.
/// This class implements the [ArticleRemote] from the Data layer
/// as it is that layers responsibility for defining the operations in which
/// data store implementation layers can carry out.
class ArticleRemoteImpl implements ArticleRemote {
  final baseUrl = 'https://hacker-news.firebaseio.com/v0/';
  ArticleRemoteMapper mapper;

  ArticleRemoteImpl(this.mapper);

  @override
  Future<List<ArticleEntity>> getArticles() async {
    var articleIds = await getTenNewArticlesIds();
    var articles = articleIds.map((id) => getArticle(id)).toList();
    return Future.wait(articles);
  }

  Future<List<int>> getTenNewArticlesIds() async {
    final response = await http.get('${baseUrl}newstories.json');
    if (response.statusCode == 200) {
      List responseJson = json.decode(response.body);
      return List<int>.from(responseJson).take(10).toList();
    }
    throw Exception("New stories couldn't be fetched");
  }

  Future<ArticleEntity> getArticle(int id) async {
    final response = await http.get('${baseUrl}item/$id.json');
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      return mapper.mapFromRemote(RemoteArticle.fromJson(responseJson));
    }
    throw Exception("Article $id couldn't be fetched.");
  }
}