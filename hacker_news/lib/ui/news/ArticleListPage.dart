import 'package:hacker_news/presentation/model/ArticleView.dart';
import 'package:hacker_news/presentation/news/ArticleListContract.dart';
import 'package:hacker_news/presentation/news/ArticleListPresenter.dart';
import 'package:hacker_news/ui/injection/Injector.dart';
import 'package:hacker_news/ui/mapper/ArticleViewModelMapper.dart';
import 'package:hacker_news/ui/model/ArticleViewModel.dart';
import 'package:hacker_news/ui/news/ArticleListView.dart';
import 'package:flutter/material.dart';

class ArticleListPage extends StatefulWidget {
  ArticleListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ArticleListPageState createState() {
    var view = injector.resolve<ArticleListPageState>();
    var presenter = injector.resolve<ArticleListPresenter>();
    view.setPresenter(presenter);

    return view;
  }
}

class ArticleListPageState extends State<ArticleListPage> implements View {
  bool _isLoading = false;
  var articles = List<ArticleViewModel>();
  Presenter presenter;
  ArticleViewModelMapper mapper;

  ArticleListPageState(this.mapper);

  @override
  void setPresenter(presenter) {
    this.presenter = presenter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildCenter(context),
    );
  }

  @override
  void initState() {
    super.initState();
    presenter.start();
  }

  @override
  void dispose() {
    presenter.stop();
    super.dispose();
  }

  @override
  void showProgress() {
    setState(() {
      _isLoading = true;
    });
  }

  @override
  void hideProgress() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void updateArticles(List<ArticleView> articles) {
    this.articles = articles.map((it) => mapper.mapToViewModel(it)).toList();
  }

  Widget _buildCenter(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Center(child: ArticleListView(this.articles));
    }
  }
}
