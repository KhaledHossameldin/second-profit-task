import 'package:fpdart/fpdart.dart';

import '../entities/event.dart';

abstract class EventsRepository {
  Future<Either<String, List<Event>>> getEvents();
}
