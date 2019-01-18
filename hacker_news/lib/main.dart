import 'package:flutter/material.dart';
import 'package:hacker_news/ui/HackerNewsApplication.dart';
import 'package:hacker_news/ui/injection/Injector.dart';

void main(){
  // Setup Injection
  var injector = Injector();
  injector.configure();

  runApp(HackerNewsApplication());
}
