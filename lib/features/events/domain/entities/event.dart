import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
class Event with _$Event {
  const factory Event({
    required String details,
    required String location,
    required String name,
    required DateTime time,
  }) = _Event;
}
