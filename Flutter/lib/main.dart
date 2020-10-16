import 'package:TheHotness/GameList/GameListRoute.dart';
import 'package:TheHotness/adaptive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveApp(
      title: 'The Hotness Flutter',
      child: MyHomePage(title: 'The Hotness'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      title: Text(title),
      child: GameListRoute(),
    );
  }
}

