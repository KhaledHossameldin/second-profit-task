import 'package:firebase_core/firebase_core.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/utils/types.dart';
import '../../domain/entities/event.dart';
import '../../domain/repositories/events_repository.dart';
import '../data_sources/remote/events_remote_data_source.dart';

class EventsRepositoryImpl implements EventsRepository {
  const EventsRepositoryImpl({required EventsRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;
  final EventsRemoteDataSource _remoteDataSource;

  @override
  Future<Result<List<Event>>> getEvents() async {
    try {
      final events = await _remoteDataSource.getEvents();
      return Right(events.map((event) => event.toEntity()).toList());
    } on FirebaseException catch (e) {
      return Left(e.message ?? 'Unknown Error');
    } catch (_) {
      return const Left('Unknown Error');
    }
  }
}
