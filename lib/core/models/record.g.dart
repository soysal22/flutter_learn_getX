// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Record _$$_RecordFromJson(Map<String, dynamic> json) => _$_Record(
      dateTime: DateTime.parse(json['dateTime'] as String),
      weight: json['weight'] as int,
      photosUrl: json['photosUrl'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$_RecordToJson(_$_Record instance) => <String, dynamic>{
      'dateTime': instance.dateTime.toIso8601String(),
      'weight': instance.weight,
      'photosUrl': instance.photosUrl,
      'note': instance.note,
    };
