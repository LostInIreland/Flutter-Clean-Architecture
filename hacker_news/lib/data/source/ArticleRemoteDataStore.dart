import 'package:hacker_news/data/model/ArticleEntity.dart';
import 'package:hacker_news/data/repository/ArticleRemote.dart';
import 'package:hacker_news/data/source/ArticleDataStore.dart';

/// Implementation of the [ArticleDataStore] interface to
/// provide a means of communicating with the remote data source
class ArticleRemoteDataStore implements ArticleDataStore {
  ArticleRemote articleRemote;

  ArticleRemoteDataStore(this.articleRemote);

  @override
  void clearArticles() {
    throw UnsupportedError;
  }

  /// Retrieve a list of [ArticleEntity] instances from remote
  @override
  Future<List<ArticleEntity>> getArticles() {
    return articleRemote.getArticles();
  }

  @override
  void saveArticles(List<ArticleEntity> articles) {
    throw UnsupportedError;
  }

}