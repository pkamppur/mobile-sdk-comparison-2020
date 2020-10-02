import 'package:flutter/material.dart';
import 'package:TheHotness/BGGApi/GameDetails.dart';

class GameInfoView extends StatelessWidget {
  GameInfoView({Key key, this.details}) : super(key: key);

  final GameDetails details;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey.shade300,
        child: Column(children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                              width: 1.0, color: Colors.grey.shade500),
                        ),
                        color: Colors.transparent,
                      ),
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    '${details.playersMin}–${details.playersMax} Players',
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                Text('Best ${details.playersBest}',
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyText1)
                              ])))),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                '${details.playingTimeMin}–${details.playingTimeMax} Min',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline6),
                            Text('Playing Time',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyText1)
                          ])))
            ],
          ),
          Divider(
            color: Colors.grey.shade500,
            height: 1,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                GameInfoContentLine(title: 'Designer: ',content: '${details.designers.map((e) => e.name).join(',')}',),
                SizedBox(
                  height: 4,
                ),
                GameInfoContentLine(title: 'Artist: ', content: '${details.artists.map((e) => e.name).join(', ')}',),
                SizedBox(
                  height: 4
                ),
                GameInfoContentLine(title: 'Publisher: ', content: '${details.publishers.first.name} + ${details.publishers.length - 1} More',),
              ],
            ),
          ),
        ]));
  }
}

class GameInfoContentLine extends StatelessWidget {
  final String title;
  final String content;

  const GameInfoContentLine({
    Key key,
    @required this.title,
    @required this.content,
  }) : super(key: key);

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
            child: Text(
              content,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .apply(fontSizeFactor: 1.2)))
      ],
    );
  }
}
