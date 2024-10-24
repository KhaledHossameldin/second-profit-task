import '../../../../core/domain/base_use_case.dart';
import '../../../../core/utils/types.dart';
import '../entities/event.dart';
import '../repositories/events_repository.dart';

class GetEventsUseCase implements BaseUseCaseNoParams<List<Event>> {
  const GetEventsUseCase({required EventsRepository repository})
      : _repository = repository;
  final EventsRepository _repository;

  @override
  Future<Result<List<Event>>> call() async => _repository.getEvents();
}
