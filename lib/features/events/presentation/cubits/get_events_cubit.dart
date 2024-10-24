import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/base_state.dart';
import '../../domain/entities/event.dart';
import '../../domain/use_cases/get_events_use_case.dart';

class GetEventsCubit extends Cubit<BaseState<List<Event>>> {
  GetEventsCubit({required GetEventsUseCase getEventsUseCase})
      : _getEventsUseCase = getEventsUseCase,
        super(const BaseState.initial());
  final GetEventsUseCase _getEventsUseCase;

  Future<void> getEvents() async {
    emit(const BaseState.loading());
    final result = await _getEventsUseCase();
    emit(result.fold(
      (error) => BaseState.failure(error: error),
      (events) {
        if (events.isEmpty) {
          return const BaseState.empty();
        }
        return BaseState.success(data: events);
      },
    ));
  }
}
