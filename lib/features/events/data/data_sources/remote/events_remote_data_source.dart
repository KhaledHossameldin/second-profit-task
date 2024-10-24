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
}

abstract class EventsRemoteDataSource {
  Future<List<EventModel>> getEvents();
}
