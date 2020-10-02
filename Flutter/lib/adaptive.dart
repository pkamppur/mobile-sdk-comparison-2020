import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveApp extends StatelessWidget {
  final String title;
  final Widget child;

  AdaptiveApp({this.title, this.child});

  static bool isApple(BuildContext context) =>
      Theme.of(context).platform == TargetPlatform.iOS;

  @override
  Widget build(BuildContext context) => AdaptiveApp.isApple(context)
      ? CupertinoApp(
          title: title,
          home: child,
        )
      : MaterialApp(
          title: title,
          theme: ThemeData(
            primarySwatch: Colors.red,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: child,
        );
}

class AdaptiveScaffold extends StatelessWidget {
  final String title;
  final Widget child;

  AdaptiveScaffold({this.title, this.child});

  @override
  Widget build(BuildContext context) => AdaptiveApp.isApple(context)
      ? CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(title),
          ),
          child: child,
        )
      : Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: child,
        );
}

class AdaptivePageRoute {
  static Route build(BuildContext context, {Function(BuildContext) builder}) =>
      AdaptiveApp.isApple(context)
          ? CupertinoPageRoute(
              builder: builder,
            )
          : MaterialPageRoute(builder: builder);
}

class AdaptiveProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => AdaptiveApp.isApple(context)
      ? CupertinoActivityIndicator()
      : CircularProgressIndicator();
}
