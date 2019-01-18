import 'package:hacker_news/cache/mapper/Mapper.dart';
import 'package:hacker_news/cache/model/CachedArticle.dart';
import 'package:hacker_news/data/model/ArticleEntity.dart';

/// Map a [CachedArticle] instance to and from a [ArticleEntity] instance
/// when data is moving between the cache later and the Data layer
class ArticleCacheMapper implements Mapper<CachedArticle, ArticleEntity> {
  @override
  ArticleEntity mapFromCache(CachedArticle type) {
    return ArticleEntity(type.id, type.title, type.type, type.descendants);
  }

  @override
  CachedArticle mapToCache(ArticleEntity type) {
    return CachedArticle(type.id, type.title, type.type, type.descendants);
  }

}