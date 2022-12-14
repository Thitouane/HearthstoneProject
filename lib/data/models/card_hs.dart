import 'package:json_annotation/json_annotation.dart';

part 'card_hs.g.dart';

@JsonSerializable()
class CardHS {
  final String cardId;
  final int? dbfId;
  final String? name;
  final String? cardSet;
  final String? type;
  final String? rarity;
  final int? cost;
  final int? attack;
  final int? health;
  final String? text;
  final String? playerClass;
  final String? flavor;
  final String? artist;
  final bool? collectible;
  final String? race;
  final String? img; //uri
  final String? locale;

  final String? faction;
  final bool? elite;
  final String? imgGold; //uri
  final String? howToGet;
  final String? howToGetGold;
  final List<String>? mecanics;

  CardHS({
    required this.cardId,
    this.dbfId,
    this.name,
    this.cardSet,
    this.type,
    this.rarity,
    this.cost,
    this.attack,
    this.health,
    this.text,
    this.playerClass,
    this.flavor,
    this.artist,
    this.collectible,
    this.race,
    this.img,
    this.locale,
    this.faction,
    this.elite,
    this.imgGold,
    this.howToGet,
    this.howToGetGold,
    this.mecanics
  });

  factory CardHS.fromJson(Map<String, dynamic> json) =>
      _$CardHSFromJson(json);

  Map<String, dynamic> toJson() => _$CardHSToJson(this);
}