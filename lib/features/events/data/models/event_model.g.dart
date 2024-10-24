// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventModelImpl _$$EventModelImplFromJson(Map<String, dynamic> json) =>
    _$EventModelImpl(
      details: json['details'] as String,
      location: json['location'] as String,
      name: json['name'] as String,
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$$EventModelImplToJson(_$EventModelImpl instance) =>
    <String, dynamic>{
      'details': instance.details,
      'location': instance.location,
      'name': instance.name,
      'time': instance.time.toIso8601String(),
    };
