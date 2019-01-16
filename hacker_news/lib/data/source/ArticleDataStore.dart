import 'package:hacker_news/data/model/ArticleEntity.dart';

/// Interface defining methods for the data operations related to Articles.
/// This is to be implemented by external data source layers,
/// setting the requirements for the operations that need to be implemented
abstract class ArticleDataStore {

  void clearArticles();

  void saveArticles(List<ArticleEntity> articles);

  Future<List<ArticleEntity>> getArticles();
}