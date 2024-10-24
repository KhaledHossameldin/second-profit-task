import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/event.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key, required this.event});
  static const route = '/details';
  final Event event;

  void _join() {}

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Event Details')),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(children: [
                const TextSpan(
                  text: 'Name: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: event.name),
              ]),
              style: textTheme.titleLarge,
            ),
            8.verticalSpace,
            Text(event.details, style: textTheme.bodyLarge),
            16.verticalSpace,
            Text(event.location, style: textTheme.bodyLarge),
            16.verticalSpace,
            Text(
              DateFormat.yMMMMEEEEd().format(event.time),
              style: textTheme.bodyLarge,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(onPressed: _join, child: const Text('Join')),
      ),
    );
  }
}
