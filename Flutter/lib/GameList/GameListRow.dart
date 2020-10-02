import 'package:TheHotness/BGGApi/Game.dart';
import 'package:TheHotness/GameList/ThumbnailView.dart';
import 'package:flutter/material.dart';

class GameListRow extends StatelessWidget {
  final Game game;

  GameListRow({Key key, this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(children: [
        ThumbnailView(thumbnailUrl: game.thumbnailUrl),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${game.name}',
                    style: Theme.of(context).textTheme.headline6),
                Text('${game.yearPublished}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .apply(color: Colors.grey))
              ],
            ),
          ),
        ),
      ]);
}
