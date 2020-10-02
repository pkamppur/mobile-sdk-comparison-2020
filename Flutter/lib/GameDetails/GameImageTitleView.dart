import 'package:flutter/material.dart';
import 'package:TheHotness/BGGApi/GameDetails.dart';

class GameImageTitleView extends StatelessWidget {
  GameImageTitleView({Key key, this.details}) : super(key: key);

  final GameDetails details;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 300,
          ),
          child: Image.network(details.imageUrl.toString()),
        ),
        Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('${details.name} ',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .apply(color: Colors.white)),
                Text('${details.yearPublished}',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .apply(color: Colors.grey))
              ],
            ))
      ]),
    );
  }
}
