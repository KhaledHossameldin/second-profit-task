import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/event_model.dart';

class EventsRemoteDataSourceImpl implements EventsRemoteDataSource {
  final _eventsFirestore = FirebaseFirestore.instance.collection('events');

  @override
  Future<List<EventModel>> getEvents() async {
    final snapshot = await _eventsFirestore.get();
    return snapshot.docs
        .map((event) => EventModel.fromJson(event.data()))
        .toList();
  }

  @override
  Future<bool> joinEvent() async {
    await Future.delayed(const Duration(seconds: 2));
    return Random().nextBool();
  }
}

abstract class EventsRemoteDataSource {
  Future<List<EventModel>> getEvents();
  Future<bool> joinEvent();
}
