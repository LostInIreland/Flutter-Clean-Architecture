
import 'package:hacker_news/data/model/ArticleEntity.dart';

/// Interface defining methods for the retrieve of Articles.
/// This is to be implemented by the remote layer, using this interface as a way of communicating
abstract class ArticleRemote {

  /// Retrieve a list of Articles, from the remote
  Future<List<ArticleEntity>> getArticles();
}