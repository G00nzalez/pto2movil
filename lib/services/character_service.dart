import 'dart:convert';

import 'package:pto2/models/character_model.dart';
import 'package:http/http.dart';

class CharacterService {

  final String _url = "https://valorant-api.com/v1/agents";
  final String _language = "?language=es-ES";
  final String _playable = "&isPlayableCharacter=true";

  Future<List<Character>> getCharacters() async {

    Uri uri = Uri.parse(_url + _language + _playable);
    // print('URI: ' + uri.toString());
    Response response = await get(uri);

    if (response.statusCode == 200) {
      CharacterResponse characterResponse = CharacterResponse.fromJson(json.decode(response.body));
      return characterResponse.data!;
    } else {
      throw Exception('Failed to load characters');
    }
  }
  
}