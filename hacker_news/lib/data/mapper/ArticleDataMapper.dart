import 'package:hacker_news/data/mapper/Mapper.dart';
import 'package:hacker_news/data/model/ArticleEntity.dart';
import 'package:hacker_news/domain/model/Article.dart';

/// Map a [ArticleEntity] to and from a [Article] instance when data is
/// moving between this later and the Domain layer
class ArticleDataMapper implements Mapper<ArticleEntity, Article> {

  /// Map a [ArticleEntity] instance to a [Article] instance
  @override
  Article mapFromEntity(ArticleEntity type) {
    return Article(type.id, type.title, ArticleType(type.type), type.descendants);
  }

  /// Map a [Article] instance to a [ArticleEntity] instance
  @override
  ArticleEntity mapToEntity(Article type) {
    return ArticleEntity(type.id, type.title, type.type.value, type.descendants);
  }
}