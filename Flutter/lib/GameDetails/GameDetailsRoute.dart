import 'dart:async';

import 'package:TheHotness/BGGApi/BGGApi.dart';
import 'package:TheHotness/BGGApi/GameDetails.dart';
import 'package:TheHotness/GameDetails/GameDescriptionView.dart';
import 'package:TheHotness/GameDetails/GameImageTitleView.dart';
import 'package:TheHotness/GameDetails/GameInfoView.dart';
import 'package:TheHotness/adaptive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameDetailsRoute extends StatefulWidget {
  GameDetailsRoute({Key key, this.gameId}) : super(key: key);

  final String gameId;

  @override
  _GameDetailsRouteState createState() => _GameDetailsRouteState();
}

class _GameDetailsRouteState extends State<GameDetailsRoute> {
  Future<GameDetails> details;

  @override
  void initState() {
    details = BGGApi.fetchGameDetails(widget.gameId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      title: FutureBuilder<GameDetails>(
        future: details,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data.name);
          } else {
            return Text("");
          }
        },
      ),
      child: SafeArea(
        bottom: false,
        child: FutureBuilder<GameDetails>(
          future: details,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: GameDetailsWidget(details: snapshot.data),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            } else {
              return Center(
                child: AdaptiveProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class GameDetailsWidget extends StatelessWidget {
  GameDetailsWidget({Key key, this.details}) : super(key: key);

  final GameDetails details;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(children: [
          GameImageTitleView(details: details),
          GameInfoView(details: details),
          GameDescriptionView(details: details),
        ]));
  }
}
