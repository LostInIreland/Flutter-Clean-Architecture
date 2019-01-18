import 'package:hacker_news/domain/interactor/FutureUseCase.dart';
import 'package:hacker_news/domain/model/Article.dart';
import 'package:hacker_news/presentation/mapper/ArticleViewMapper.dart';
import 'package:hacker_news/presentation/news/ArticleListContract.dart';

class ArticleListPresenter implements Presenter {
  View view;
  FutureUseCase<void, List<Article>> getArticlesUseCase;
  ArticleViewMapper mapper;

  ArticleListPresenter(this.view, this.getArticlesUseCase, this.mapper);

  @override
  void start() {
    getArticles();
  }

  @override
  void stop() {}

  @override
  void getArticles() {
    view.showProgress();

    Future<List<Article>> future = getArticlesUseCase.execute(null);
    future.then((articles) {
      view.hideProgress();
      view.updateArticles(
          articles.map((it) => mapper.mapToView(it)).toList());
    }).catchError((e) {
      print(e);
      view.hideProgress();
    });
  }
}