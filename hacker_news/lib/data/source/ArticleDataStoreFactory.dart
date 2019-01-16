import 'package:hacker_news/data/repository/ArticleCache.dart';
import 'package:hacker_news/data/source/ArticleCacheDataStore.dart';
import 'package:hacker_news/data/source/ArticleDataStore.dart';
import 'package:hacker_news/data/source/ArticleRemoteDataStore.dart';

/// Create an instance of a ArticleDataStore
class ArticleDataStoreFactory {
  ArticleCache articleCache;
  ArticleCacheDataStore articleCacheDataStore;
  ArticleRemoteDataStore articleRemoteDataStore;

  ArticleDataStoreFactory(this.articleCache, this.articleCacheDataStore,
      this.articleRemoteDataStore);

  /// Returns a DataStore based on whether or not there is content in the cache
  /// and the cache has not expired
  Future<ArticleDataStore> retrieveDataStore() async {
    if (await articleCache.isCached() &&
        !await articleCache.isExpired()) {
      return retrieveCacheDataStore();
    }
    return articleRemoteDataStore;
  }

  /// Return an instance of the Cache Data Store
  ArticleDataStore retrieveCacheDataStore() {
    return articleCacheDataStore;
  }

  /// Return an instance of the Remote Data Store
  ArticleDataStore retrieveRemoteDataStore() {
    return articleRemoteDataStore;
  }
}