import 'package:hacker_news/cache/ArticleCacheImpl.dart';
import 'package:hacker_news/cache/PreferencesHelper.dart';
import 'package:hacker_news/cache/db/ArticleDbMapper.dart';
import 'package:hacker_news/cache/db/DbHelper.dart';
import 'package:hacker_news/cache/mapper/ArticleCacheMapper.dart';
import 'package:hacker_news/data/ArticleDataRepository.dart';
import 'package:hacker_news/data/mapper/ArticleDataMapper.dart';
import 'package:hacker_news/data/source/ArticleCacheDataStore.dart';
import 'package:hacker_news/data/source/ArticleDataStoreFactory.dart';
import 'package:hacker_news/data/source/ArticleRemoteDataStore.dart';
import 'package:hacker_news/domain/interactor/news/GetArticles.dart';
import 'package:hacker_news/presentation/mapper/ArticleViewMapper.dart';
import 'package:hacker_news/presentation/news/ArticleListPresenter.dart';
import 'package:hacker_news/remote/ArticleRemoteImpl.dart';
import 'package:hacker_news/remote/mapper/ArticleRemoteMapper.dart';
import 'package:hacker_news/ui/mapper/ArticleViewModelMapper.dart';
import 'package:hacker_news/ui/news/ArticleListPage.dart';
import 'package:kiwi/kiwi.dart';

/// Configure to provide dependencies
class Injector {
  void configure() {
    final Container container = Container();
    container.registerSingleton((it) => PreferencesHelper());
    container.registerSingleton((it) => DbHelper());

    container.registerInstance(ArticleCacheMapper());
    container.registerInstance(ArticleDbMapper());
    container.registerInstance(ArticleCacheImpl(
      container.resolve<DbHelper>(),
      container.resolve<PreferencesHelper>(),
      container.resolve<ArticleCacheMapper>(),
      container.resolve<ArticleDbMapper>(),
    ));

    container.registerInstance(
        ArticleCacheDataStore(container.resolve<ArticleCacheImpl>()));

    container.registerInstance(ArticleRemoteMapper());
    container.registerInstance(
        ArticleRemoteImpl(container.resolve<ArticleRemoteMapper>()));
    container.registerInstance(
        ArticleRemoteDataStore(container.resolve<ArticleRemoteImpl>()));

    container.registerInstance(ArticleDataStoreFactory(
        container.resolve<ArticleCacheImpl>(),
        container.resolve<ArticleCacheDataStore>(),
        container.resolve<ArticleRemoteDataStore>()));

    container.registerInstance(ArticleDataMapper());

    container.registerInstance(ArticleDataRepository(
        container.resolve<ArticleDataStoreFactory>(),
        container.resolve<ArticleDataMapper>()));

    container.registerInstance(
        GetArticles(container.resolve<ArticleDataRepository>()));

    container.registerInstance(ArticleViewMapper());

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
