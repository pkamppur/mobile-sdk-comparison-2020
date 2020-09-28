class Game {
  final String id;
  final String name;
  final String yearPublished;
  final Uri thumbnailUrl;

  Game({this.id, this.name, this.yearPublished, this.thumbnailUrl});

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'],
      name: json['name'],
      yearPublished: json['yearPublished'],
      thumbnailUrl: Uri.parse(json['thumbnailUrl']),
    );
  }
}
