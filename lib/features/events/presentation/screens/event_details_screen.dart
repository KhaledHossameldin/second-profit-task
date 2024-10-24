import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';

import '../../../../core/cubits/base_state.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/event.dart';
import '../cubits/join_event_cubit.dart';

class EventDetailsScreen extends StatelessWidget {
  EventDetailsScreen({super.key, required this.event});
  static const route = '/details';
  final Event event;

  final _cubit = sl<JoinEventCubit>();
  void _join() => _cubit.joinEvent();

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
        child: ElevatedButton(
          onPressed: _join,
          child: BlocConsumer<JoinEventCubit, BaseState<bool>>(
            bloc: _cubit,
            listener: (context, state) => state.whenOrNull(
              failure: (error) => error.showToast(
                type: ToastificationType.error,
              ),
              success: (_) => 'Joined to event successfully'.showToast(
                type: ToastificationType.success,
              ),
            ),
            builder: (context, state) => state.maybeWhen(
              loading: () => const CircularProgressIndicator(),
              orElse: () => const Text('Join Event'),
            ),
          ),
        ),
      ),
    );
  }
}
