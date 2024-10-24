import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/event.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key, required this.item});
  final Event item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(item.name),
        subtitle: Text(item.location),
        trailing: Text(DateFormat.yMEd().format(item.time)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onTap: () {},
      ),
    );
  }
}
