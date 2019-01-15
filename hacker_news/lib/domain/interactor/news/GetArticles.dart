

import 'package:hacker_news/domain/ArticleRepository.dart';
import 'package:hacker_news/domain/interactor/FutureUseCase.dart';
import 'package:hacker_news/domain/model/Article.dart';

/// Use case used for retrieving a [List] of [Article] instances from the [ArticleRepository]
class GetArticles extends FutureUseCase<void, List<Article>> {
  ArticleRepository articleRepository;

  GetArticles(this.articleRepository);

  @override
  Future<List<Article>> execute(void params) {
    var articles = articleRepository.getArticles();
    return articles;
  }
}