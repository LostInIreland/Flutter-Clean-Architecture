import 'package:hacker_news/presentation/BasePresenter.dart';
import 'package:hacker_news/presentation/BaseView.dart';
import 'package:hacker_news/presentation/model/ArticleView.dart';

/// Defines a contract of operations between the ArticleList Presenter and ArticleList View
abstract class Presenter extends BasePresenter {

  void getArticles();

}

/// Defines a contract of operations between the ArticleList Presenter and ArticleList View
abstract class View extends BaseView {

  void showProgress();
  void hideProgress();

  void updateArticles(List<ArticleView> articles);
}
