import 'package:flutter/material.dart';

import '../../domain/entities/event.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key, required this.event});
  static const route = '/details';
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Event Details')),
      body: Center(child: Text(event.name)),
    );
  }
}
