import 'package:hacker_news/domain/model/Article.dart';

/// Interface defining methods for how the data layer can pass data to and from the Domain layer.
/// This is to be implemented by the data layer, setting the requirements for the
/// operations that need to be implemented
abstract class ArticleRepository {

  Future<List<Article>> getArticles();

}