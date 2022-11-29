import 'package:json_annotation/json_annotation.dart';

part 'info.g.dart';

@JsonSerializable()
class Info {
  final String patch;
  final List<String> classes;
  final List<String> sets;
  final List<String> standard;
  final List<String> wild;
  final List<String> types;
  final List<String> factions;
  final List<String> qualities;
  final List<String> races;
  final List<String> locales;

  Info({
    required this.patch,
    required this.classes,
    required this.sets,
    required this.standard,
    required this.wild,
    required this.types,
    required this.factions,
    required this.qualities,
    required this.races,
    required this.locales
  });

  factory Info.fromJson(Map<String, dynamic> json) =>
      _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}