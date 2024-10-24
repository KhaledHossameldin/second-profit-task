import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/cubits/base_state.dart';
import '../../../../injection_container.dart';
import '../../../../main.dart';
import '../../domain/entities/event.dart';
import '../cubits/get_events_cubit.dart';

class EventsListScreen extends StatefulWidget {
  const EventsListScreen({super.key});

  @override
  State<EventsListScreen> createState() => _EventsListScreenState();
}

class _EventsListScreenState extends State<EventsListScreen> {
  final _cubit = sl<GetEventsCubit>();

  @override
  void initState() {
    _cubit.getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Events')),
      body: BlocBuilder<GetEventsCubit, BaseState<List<Event>>>(
        bloc: _cubit,
        builder: (context, state) => state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          failure: (error) => Center(child: Text(error)),
          success: (events) => ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            itemCount: events.length,
            separatorBuilder: (_, __) => 16.verticalSpace,
            itemBuilder: (_, index) => Text(events[index].name),
          ),
          orElse: () => const Material(),
        ),
      ),
    );
  }
}
