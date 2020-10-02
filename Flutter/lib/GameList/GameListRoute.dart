import 'dart:async';

import 'package:TheHotness/BGGApi/BGGApi.dart';
import 'package:TheHotness/GameDetails/GameDetailsRoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:TheHotness/BGGApi/Game.dart';
import 'package:TheHotness/GameList/GameListRow.dart';

class GameListRoute extends StatefulWidget {
  GameListRoute({Key key}) : super(key: key);

  @override
  _GameListRouteState createState() => _GameListRouteState();
}

class _GameListRouteState extends State<GameListRoute> {
  Future<List<Game>> gameList;

  @override
  void initState() {
    gameList = BGGApi.fetchTheHotness();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: FutureBuilder<List<Game>>(
        future: gameList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _LoadedGameList(games: snapshot.data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class _LoadedGameList extends StatelessWidget {
  final List<Game> games;

  _LoadedGameList({Key key, this.games}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.separated(
        padding: const EdgeInsets.only(left: 10),
        itemCount: games.length,
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 1, color: Colors.grey.shade300),
        itemBuilder: (BuildContext context, int index) {
          final game = games[index];
          return GestureDetector(
            child: GameListRow(game: game),
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => GameDetailsRoute(gameId: game.id),
                ),
              );
            },
          );
        },
      );
}
