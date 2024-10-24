import '../../../../core/utils/types.dart';
import '../entities/event.dart';

abstract class EventsRepository {
  Future<Result<List<Event>>> getEvents();
  Future<Result<bool>> joinEvent();
}
