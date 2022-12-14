// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
      patch: json['patch'] as String,
      classes:
          (json['classes'] as List<dynamic>).map((e) => e as String).toList(),
      sets: (json['sets'] as List<dynamic>).map((e) => e as String).toList(),
      standard:
          (json['standard'] as List<dynamic>).map((e) => e as String).toList(),
      wild: (json['wild'] as List<dynamic>).map((e) => e as String).toList(),
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
      factions:
          (json['factions'] as List<dynamic>).map((e) => e as String).toList(),
      qualities:
          (json['qualities'] as List<dynamic>).map((e) => e as String).toList(),
      races: (json['races'] as List<dynamic>).map((e) => e as String).toList(),
      locales:
          (json['locales'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'patch': instance.patch,
      'classes': instance.classes,
      'sets': instance.sets,
      'standard': instance.standard,
      'wild': instance.wild,
      'types': instance.types,
      'factions': instance.factions,
      'qualities': instance.qualities,
      'races': instance.races,
      'locales': instance.locales,
    };
