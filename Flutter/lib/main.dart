import 'package:TheHotness/GameList/GameListRoute.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Hotness Flutter',
      theme: ThemeData(
        primarySwatch: MaterialColor(
          0xFFFFFFFF,
          <int, Color>{
            50: Color(0xFFFAFAFA),
            100: Color(0xFFF5F5F5),
            200: Color(0xFFEEEEEE),
            300: Color(0xFFE0E0E0),
            350: Color(0xFFD6D6D6),
            400: Color(0xFFBDBDBD),
            500: Color(0xFFFFFFFF),
            600: Color(0xFF757575),
            700: Color(0xFF616161),
            800: Color(0xFF424242),
            850: Color(0xFF303030), // only for background color in dark theme
            900: Color(0xFF212121),
          },
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'The Hotness'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GameListRoute(),
    );
  }
}
