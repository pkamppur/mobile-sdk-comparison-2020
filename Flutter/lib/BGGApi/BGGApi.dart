import 'dart:convert';
import 'package:TheHotness/BGGApi/Game.dart';
import 'package:http/http.dart' as http;
import 'package:TheHotness/BGGApi/GameDetails.dart';

class BGGApi {
  static final _baseUrl = 'http://localhost:38651/api';

  static Future<GameDetails> fetchGameDetails(String gameId) async {
    final response = await http.get('$_baseUrl/games/$gameId/details');

    if (response.statusCode == 200) {
      return GameDetails.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load list: ${response.statusCode}');
    }
  }

  static Future<List<Game>> fetchTheHotness() async {
    final response = await http.get('$_baseUrl/the-hotness');

    if (response.statusCode == 200) {
      return _GameListResponse.fromJson(json.decode(response.body)).items;
    } else {
      throw Exception('Failed to load list: ${response.statusCode}');
    }
  }
}

class _GameListResponse {
  final List<Game> items;

  _GameListResponse({this.items});

  factory _GameListResponse.fromJson(Map<String, dynamic> json) {
    final jsonItems = json['items'] as List;
    return _GameListResponse(
        items: jsonItems.map((gameJson) => Game.fromJson(gameJson)).toList());
  }
}
