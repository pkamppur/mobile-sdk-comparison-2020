import 'package:flutter/material.dart';

class ThumbnailView extends StatelessWidget {
  final Uri thumbnailUrl;

  ThumbnailView({Key key, this.thumbnailUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: FittedBox(
          child: Image.network(thumbnailUrl.toString()),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
