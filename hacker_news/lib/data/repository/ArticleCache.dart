import 'package:hacker_news/data/model/ArticleEntity.dart';

/// Interface defining methods for the caching of Articles.
/// This is to be implemented by the cache layer, using this interface as a way of communicating.
abstract class ArticleCache {

  /// Clear all Articles from the cache
  Future<void> clearArticles();

  /// Save a given list of Article to the cache
  Future<void> saveArticles(List<ArticleEntity> articles);

  /// Retrieve a list of Article, from the cache
  Future<List<ArticleEntity>> getArticles();

  /// Checks if an element (Article) exists in the cache.
  Future<bool> isCached();

  /// Save the time of an element (Article) cached.
  Future<void> setLastCacheTime(int lastCacheTime);

  /// Checks if the cache is expired.
  Future<bool> isExpired();
}