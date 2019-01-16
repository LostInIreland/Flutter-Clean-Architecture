import 'package:hacker_news/data/mapper/ArticleDataMapper.dart';
import 'package:hacker_news/data/source/ArticleDataStoreFactory.dart';
import 'package:hacker_news/data/source/ArticleRemoteDataStore.dart';
import 'package:hacker_news/domain/ArticleRepository.dart';
import 'package:hacker_news/domain/model/Article.dart';

/// Provides an implementation of the [ArticleRepository] interface for
/// communicating to and from data sources
class ArticleDataRepository implements ArticleRepository {
  ArticleDataStoreFactory factory;
  ArticleDataMapper mapper;

  ArticleDataRepository(this.factory, this.mapper);

  @override
  Future<List<Article>> getArticles() async {
    var dataStore = await factory.retrieveDataStore();
    var articles = await dataStore.getArticles();

    // Save Remote data to cache
    if (dataStore is ArticleRemoteDataStore) {
      clearArticles();
      factory.retrieveCacheDataStore().saveArticles(articles);
    }
    return articles.map((it) => mapper.mapFromEntity(it)).toList();
  }

  void clearArticles() {
    factory.retrieveCacheDataStore().clearArticles();
  }
}