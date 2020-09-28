import 'package:flutter/material.dart';

class ThumbnailView extends StatelessWidget {
  ThumbnailView({Key key, this.thumbnailUrl}) : super(key: key);

  final Uri thumbnailUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 80,
        height: 80,
        margin: const EdgeInsets.only(top: 8, bottom: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: FittedBox(
            child: Image.network(thumbnailUrl.toString()),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ));
  }
}
