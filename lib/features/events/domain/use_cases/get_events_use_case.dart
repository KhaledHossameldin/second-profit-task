import 'package:fpdart/fpdart.dart';

import '../entities/event.dart';
import '../repositories/events_repository.dart';

class GetEventsUseCase {
  const GetEventsUseCase({required EventsRepository repository})
      : _repository = repository;
  final EventsRepository _repository;

  Future<Either<String, List<Event>>> call() async {
    return _repository.getEvents();
  }
}
