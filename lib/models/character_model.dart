// To parse this JSON data, do
//
//     final characterResponse = characterResponseFromJson(jsonString);

import 'dart:convert';

CharacterResponse characterResponseFromJson(String str) =>
    CharacterResponse.fromJson(json.decode(str));

class CharacterResponse {
  List<Character>? data;

  CharacterResponse({
    this.data,
  });

  factory CharacterResponse.fromJson(Map<String, dynamic> json) =>
      CharacterResponse(
        data: json["data"] == null
            ? []
            : List<Character>.from(
                json["data"]!.map((x) => Character.fromJson(x))),
      );
}

class Character {
  String? displayName;
  String? description;
  String? displayIcon;
  String? displayIconSmall;
  String? bustPortrait;
  String? fullPortrait;
  String? fullPortraitV2;
  String? killfeedPortrait;
  String? background;
  List<String>? backgroundGradientColors;
  String? assetPath;
  List<Ability>? abilities;

  Character({
    this.displayName,
    this.description,
    this.displayIcon,
    this.displayIconSmall,
    this.bustPortrait,
    this.fullPortrait,
    this.fullPortraitV2,
    this.killfeedPortrait,
    this.background,
    this.backgroundGradientColors,
    this.assetPath,
    this.abilities,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        displayName: json["displayName"],
        description: json["description"],
        displayIcon: json["displayIcon"],
        displayIconSmall: json["displayIconSmall"],
        bustPortrait: json["bustPortrait"],
        fullPortrait: json["fullPortrait"],
        fullPortraitV2: json["fullPortraitV2"],
        killfeedPortrait: json["killfeedPortrait"],
        background: json["background"],
        backgroundGradientColors: json["backgroundGradientColors"] == null
            ? []
            : List<String>.from(
                json["backgroundGradientColors"]!.map((x) => x)),
        assetPath: json["assetPath"],
        abilities: json["abilities"] == null
            ? []
            : List<Ability>.from(
                json["abilities"]!.map((x) => Ability.fromJson(x))),
      );
}

class Ability {
  String? displayName;
  String? description;
  String? displayIcon;

  Ability({
    this.displayName,
    this.description,
    this.displayIcon,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        displayName: json["displayName"],
        description: json["description"],
        displayIcon: json["displayIcon"],
      );
}
