import '../../../../core/domain/base_use_case.dart';
import '../../../../core/utils/types.dart';
import '../repositories/events_repository.dart';

class JoinEventUseCase implements BaseUseCaseNoParams<bool> {
  final EventsRepository _repository;
  const JoinEventUseCase({required EventsRepository repository})
      : _repository = repository;

  @override
  Future<Result<bool>> call() => _repository.joinEvent();
}
