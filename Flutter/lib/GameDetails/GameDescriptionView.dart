import 'package:flutter/material.dart';
import 'package:TheHotness/BGGApi/GameDetails.dart';

class GameDescriptionView extends StatelessWidget {
  GameDescriptionView({Key key, this.details}) : super(key: key);

  final GameDetails details;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        alignment: Alignment.topLeft,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Description', style: Theme.of(context).textTheme.headline6),
          SizedBox(height: 5),
          Divider(
            color: Colors.grey.shade400,
            height: 1,
            thickness: 1,
          ),
          SizedBox(height: 10),
          Container(
              color: Colors.grey.shade100,
              width: double.infinity,
              padding: EdgeInsets.all(8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _category('Category', details.categories, context) +
                      [SizedBox(height: 10)] +
                      _category('Mechanisms', details.mechanisms, context) +
                      [SizedBox(height: 10)] +
                      _category('Family', details.families, context))),
          SizedBox(height: 10),
          Text(details.description,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .apply(fontSizeFactor: 1.2))
        ]));
  }

  static _category(String title, List<Link> items, BuildContext context) {
    return [
          Text('Category',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .apply(fontSizeFactor: 1.2)),
          SizedBox(height: 3)
        ] +
        items
            .expand((element) => [
                  Text('${element.name}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .apply(fontSizeFactor: 1.2)),
                  SizedBox(height: 3)
                ])
            .toList();
  }
}
