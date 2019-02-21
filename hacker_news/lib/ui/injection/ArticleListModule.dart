import 'package:hacker_news/domain/interactor/news/GetArticles.dart';
import 'package:hacker_news/presentation/mapper/ArticleViewMapper.dart';
import 'package:hacker_news/presentation/news/ArticleListPresenter.dart';
import 'package:hacker_news/ui/injection/Module.dart';
import 'package:hacker_news/ui/mapper/ArticleViewModelMapper.dart';
import 'package:hacker_news/ui/news/ArticleListPage.dart';
import 'package:kiwi/kiwi.dart';

class ArticleListModule extends Module {
  @override
  void registerOn(Container container) {
    // View
    container.registerInstance(ArticleViewModelMapper());
    container.registerInstance(
        ArticleListPageState(container.resolve<ArticleViewModelMapper>()));
    // Presenter
    container.registerInstance(ArticleListPresenter(
        container.resolve<ArticleListPageState>(),
        container.resolve<GetArticles>(),
        container.resolve<ArticleViewMapper>()));
  }
}