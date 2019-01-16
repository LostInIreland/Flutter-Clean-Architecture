import 'package:hacker_news/data/model/ArticleEntity.dart';
import 'package:hacker_news/data/repository/ArticleCache.dart';
import 'package:hacker_news/data/source/ArticleDataStore.dart';

/// Implementation of the [ArticleDataStore] interface to
/// provide a means of communicating with the local data source
class ArticleCacheDataStore implements ArticleDataStore {
  ArticleCache articleCache;

  ArticleCacheDataStore(this.articleCache);

  /// Clear all Articles from the cache
  @override
  void clearArticles() {
    articleCache.clearArticles();
  }

  /// Retrieve a list of [ArticleEntity] instance from the remote
  @override
  Future<List<ArticleEntity>> getArticles() {
    return articleCache.getArticles();
  }

  /// Save a given list of [ArticleEntity] instances to the cache
  @override
  void saveArticles(List<ArticleEntity> articles) async {
    await articleCache.saveArticles(articles);
    await articleCache.setLastCacheTime(DateTime.now().millisecondsSinceEpoch);
  }
}