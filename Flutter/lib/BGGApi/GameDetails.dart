class GameDetails {
  final String id;
  final String name;
  final Uri imageUrl;
  final Uri thumbnailUrl;
  final String description;
  final String yearPublished;

  final List<Link> categories;
  final List<Link> mechanisms;
  final List<Link> designers;
  final List<Link> artists;
  final List<Link> expansions;
  final List<Link> families;
  final List<Link> implementations;
  final List<Link> publishers;
  final int playersMin;
  final int playersMax;
  final int playersBest;
  final int playingTime;
  final int playingTimeMin;
  final int playingTimeMax;

  GameDetails({
    this.id,
    this.name,
    this.imageUrl,
    this.thumbnailUrl,
    this.description,
    this.yearPublished,
    this.categories,
    this.mechanisms,
    this.designers,
    this.artists,
    this.expansions,
    this.families,
    this.implementations,
    this.publishers,
    this.playersMin,
    this.playersMax,
    this.playersBest,
    this.playingTime,
    this.playingTimeMin,
    this.playingTimeMax,
  });

  factory GameDetails.fromJson(Map<String, dynamic> json) {
    return GameDetails(
      id: json['id'],
      name: json['name'],
      imageUrl: Uri.parse(json['imageUrl']),
      thumbnailUrl: Uri.parse(json['thumbnailUrl']),
      description: json['description'],
      yearPublished: json['yearPublished'],
      categories: _parseLinkList('categories', json),
      mechanisms: _parseLinkList('mechanisms', json),
      designers: _parseLinkList('designers', json),
      artists: _parseLinkList('artists', json),
      expansions: _parseLinkList('expansions', json),
      families: _parseLinkList('families', json),
      implementations: _parseLinkList('implementations', json),
      publishers: _parseLinkList('publishers', json),
      playersMin: json['playersMin'],
      playersMax: json['playersMax'],
      playersBest: json['playersBest'],
      playingTime: json['playingTime'],
      playingTimeMin: json['playingTimeMin'],
      playingTimeMax: json['playingTimeMax'],
    );
  }
  static _parseLinkList(String key, Map<String, dynamic> json) {
    return (json[key] as List)
        .map((linkJson) => Link.fromJson(linkJson))
        .toList();
  }
}

class Link {
  final String name;
  final String id;

  Link({this.name, this.id});

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      id: json['id'],
      name: json['name'],
    );
  }
}
