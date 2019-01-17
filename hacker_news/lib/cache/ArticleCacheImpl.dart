import 'package:hacker_news/cache/PreferencesHelper.dart';
import 'package:hacker_news/cache/db/ArticleDbMapper.dart';
import 'package:hacker_news/cache/db/Db.dart';
import 'package:hacker_news/cache/db/DbHelper.dart';
import 'package:hacker_news/cache/mapper/ArticleCacheMapper.dart';
import 'package:hacker_news/cache/model/CachedArticle.dart';
import 'package:hacker_news/data/model/ArticleEntity.dart';
import 'package:hacker_news/data/repository/ArticleCache.dart';

/// Cached implementation for retrieving and saving Article instances.
/// This class implements the [ArticleCache] from the Data layer as
/// it is that layers responsibility for defining the operations in
/// which data store implementation layers can carry out.
class ArticleCacheImpl implements ArticleCache {
  static const int EXPIRATION_TIME = (1000 * 60);

  ArticleDbMapper articleDbMapper;
  ArticleCacheMapper articleCacheMapper;
  DbHelper dbHelper;
  PreferencesHelper preferencesHelper;

  ArticleCacheImpl(this.dbHelper, this.preferencesHelper,
      this.articleCacheMapper, this.articleDbMapper);

  /// Remove all the data from all the tables in the database.
  @override
  Future<void> clearArticles() async {
    var database = await dbHelper.database;
    return database.delete(ArticleTable.TABLE_NAME);
  }

  /// Save the given list of [ArticleEntity] instances to the database.
  @override
  Future<void> saveArticles(List<ArticleEntity> articles) async {
    articles.forEach((it) => saveArticle(articleCacheMapper.mapToCache(it)));
  }

  /// Helper method for saving a [CachedArticle] instance to the database.
  Future<void> saveArticle(CachedArticle article) async {
    var database = await dbHelper.database;
    return await database.insert(
        ArticleTable.TABLE_NAME, articleDbMapper.mapToMapValues(article));
  }

  /// Retrieve a list of [ArticleEntity] instances from the database.
  @override
  Future<List<ArticleEntity>> getArticles() async {
    var database = await dbHelper.database;
    List<Map<String, dynamic>> mapValuesList =
        await database.query(ArticleTable.TABLE_NAME);

    List<ArticleEntity> articles = mapValuesList.isNotEmpty
        ? mapValuesList
            .map((it) => articleCacheMapper
                .mapFromCache(articleDbMapper.mapFromMapValues(it)))
            .toList()
        : [];

    return articles;
  }

  /// Checked whether there are instances of [CachedArticle] stored in the cache
  @override
  Future<bool> isCached() async {
    var database = await dbHelper.database;
    List<Map<String, dynamic>> mapValuesList =
        await database.query(ArticleTable.TABLE_NAME);
    return mapValuesList.length > 0;
  }

  /// Set a point in time at when the cache was last updated
  @override
  Future<void> setLastCacheTime(int lastCacheTime) async {
    await preferencesHelper.setLastCacheTime(lastCacheTime);
  }

  /// Check whether the current cached data exceeds the defined [EXPIRATION_TIME] time
  @override
  Future<bool> isExpired() async {
    int currentTimeMills = new DateTime.now().millisecondsSinceEpoch;
    int lastUpdateTime = await preferencesHelper.getLastCacheTime();
    return currentTimeMills - lastUpdateTime > EXPIRATION_TIME;
  }
}
