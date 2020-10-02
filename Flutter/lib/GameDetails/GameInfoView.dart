import 'package:flutter/material.dart';
import 'package:TheHotness/BGGApi/GameDetails.dart';

class GameInfoView extends StatelessWidget {
  GameInfoView({Key key, this.details}) : super(key: key);

  final GameDetails details;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: Column(
        children: [
          GameFormatWidget(details: details),
          Divider(
            color: Colors.grey.shade500,
            height: 1,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                GameInfoContentLine(
                  title: 'Designer: ',
                  content: '${details.designers.map((e) => e.name).join(',')}',
                ),
                SizedBox(
                  height: 4,
                ),
                GameInfoContentLine(
                  title: 'Artist: ',
                  content: '${details.artists.map((e) => e.name).join(', ')}',
                ),
                SizedBox(height: 4),
                GameInfoContentLine(
                  title: 'Publisher: ',
                  content:
                      '${details.publishers.first.name} + ${details.publishers.length - 1} More',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GameFormatWidget extends StatelessWidget {
  final GameDetails details;

  const GameFormatWidget({Key key, @required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildRowItem(
              context,
              title: '${details.playersMin}–${details.playersMax} Players',
              subtitle: 'Best ${details.playersBest}',
            ),
            VerticalDivider(thickness: 1, color: Colors.grey.shade500),
            buildRowItem(
              context,
              title: '${details.playingTimeMin}–${details.playingTimeMax} Min',
              subtitle: 'Playing Time',
            ),
          ],
        ),
      );

  Widget buildRowItem(BuildContext context, {String title, String subtitle}) =>
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6),
              Text(subtitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1)
            ],
          ),
        ),
      );
}

class GameInfoContentLine extends StatelessWidget {
  final String title;
  final String content;

  const GameInfoContentLine(
      {Key key, @required this.title, @required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .apply(fontSizeFactor: 1.2)),
        Expanded(
          child: Text(content,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .apply(fontSizeFactor: 1.2)),
        ),
      ],
    );
  }
}
