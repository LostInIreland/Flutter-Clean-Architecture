import 'package:hacker_news/domain/model/Article.dart';
import 'package:hacker_news/presentation/mapper/Mapper.dart';
import 'package:hacker_news/presentation/model/ArticleView.dart';

/// Map a [ArticleView] from a [Article] instance
/// when data is moving between this layer and the Domain layer
class ArticleViewMapper implements Mapper<Article, ArticleView> {
  @override
  ArticleView mapToView(Article type) {
    return ArticleView(type.id, type.title, type.type.value, type.descendants);
  }
}