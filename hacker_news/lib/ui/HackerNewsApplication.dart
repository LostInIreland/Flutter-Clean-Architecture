import 'package:flutter/material.dart';
import 'package:hacker_news/ui/news/ArticleListPage.dart';

class HackerNewsApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ArticleListPage(
        title: 'Flutter Hacker News',
      ),
    );
  }
}


