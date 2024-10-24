import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/base_state.dart';
import '../../domain/use_cases/join_event_use_case.dart';

class JoinEventCubit extends Cubit<BaseState<bool>> {
  JoinEventCubit({required JoinEventUseCase joinEventUseCase})
      : _joinEventUseCase = joinEventUseCase,
        super(const BaseState.initial());
  final JoinEventUseCase _joinEventUseCase;

  Future<void> joinEvent() async {
    emit(const BaseState.loading());
    final result = await _joinEventUseCase();
    emit(result.fold(
      (error) => BaseState.failure(error: error),
      (result) => BaseState.success(data: result),
    ));
  }
}
