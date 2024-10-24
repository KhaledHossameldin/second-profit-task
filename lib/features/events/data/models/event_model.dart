import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/convertors.dart';
import '../../domain/entities/event.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';

@freezed
class EventModel with _$EventModel {
  const EventModel._();

  const factory EventModel({
    required String details,
    required String location,
    required String name,
    @TimestampToDateTimeConverter() required DateTime time,
  }) = _EventModel;

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  Event toEntity() => Event(
        details: details,
        location: location,
        name: name,
        time: time,
      );
}
