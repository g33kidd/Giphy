import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:giphy/models/gif.dart';
import 'package:giphy/models/images.dart';

class GiphyAPI {
  final String apiKey;
  final String apiHost = "http://api.giphy.com/v1";

  final String _trending = "/gifs/trending";
  final String _random = "/gifs/random";
  final String _translate = "/gifs/translate";

  GiphyAPI({this.apiKey}) : assert(apiKey != null);

  dynamic makeRequest(endpoint, args) async {
    final response = await http.get("$apiHost$endpoint?api_key=$apiKey&$args");
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Request failed.");
    }
  }

  Future<List<GIF>> trending({limit: 25, offset: 0, rating: 'g'}) async {
    final json = await makeRequest(
      _trending,
      "limit=$limit&offset=$offset&rating=$rating",
    );

    final data = json['data'] as List;
    assert(json != null);
    return data.map((i) {
      return GIF.fromJson(i);
    }).toList();
  }

  Future<GIF> random({tag: 'burrito', rating: 'g'}) async {
    final json = await makeRequest(
      _random,
      "tag=$tag&rating=$rating",
    );

    return GIF.fromJson(json['data']);
  }

  Future<GIF> translate(string, {weirdness: 0}) async {
    final json = await makeRequest(
      _translate,
      "s=$string&weirdness=$weirdness",
    );

    return GIF.fromJson(json['data']);
  }

  // TODO: SEARCH
  // Future<List<GIF>> search(query) async {
  //   final json = await makeRequest();
  // }
}
