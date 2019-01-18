import 'package:flutter/material.dart';
import 'package:hacker_news/ui/model/ArticleViewModel.dart';

class ArticleListView extends StatelessWidget {
  final List<ArticleViewModel> articles;

  ArticleListView(this.articles);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: articles
          .map((article) => Padding(
                key: Key(article.title),
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 12.0),
                child: ExpansionTile(
                  title: Text(article.title ?? '[null]',
                      style: TextStyle(fontSize: 24.0)),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('${article.descendants} comments'),
                              SizedBox(width: 16.0),
                              IconButton(
                                icon: Icon(Icons.launch),
                                onPressed: () {},
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
