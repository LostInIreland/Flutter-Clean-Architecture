import 'package:flutter/material.dart';
import 'package:hacker_news/ui/HackerNewsApplication.dart';
import 'package:hacker_news/ui/injection/ApplicationModule.dart';
import 'package:hacker_news/ui/injection/ArticleListModule.dart';
import 'package:hacker_news/ui/injection/Injector.dart';

void main() {
  // Setup Injection
  injector.inject([
    ApplicationModule(),
    ArticleListModule()
  ]);

  runApp(HackerNewsApplication());
}
