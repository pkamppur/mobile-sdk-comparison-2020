import 'package:TheHotness/BGGApi/Game.dart';
import 'package:TheHotness/GameList/ThumbnailView.dart';
import 'package:flutter/material.dart';

class GameListRow extends StatelessWidget {
  GameListRow({Key key, this.game}) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        ThumbnailView(thumbnailUrl: game.thumbnailUrl),
        Flexible(
            child: Container(
                margin: const EdgeInsets.only(left: 8),
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
                )))
      ]),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey.shade300),
        ),
        color: Colors.transparent,
      ),
    );
  }
}
