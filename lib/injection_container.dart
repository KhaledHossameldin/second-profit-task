import 'package:get_it/get_it.dart';

import 'features/events/data/data_sources/remote/events_remote_data_source.dart';
import 'features/events/data/repositories/events_repository_impl.dart';
import 'features/events/domain/repositories/events_repository.dart';

final sl = GetIt.instance;

void init() {
  //* Features - Events
  //! Cubits
  //! Use Cases
  //! Repositories
  sl.registerLazySingleton<EventsRepository>(
    () => EventsRepositoryImpl(remoteDataSource: sl()),
  );
  //! Data sources
  sl.registerLazySingleton<EventsRemoteDataSource>(
    () => EventsRemoteDataSourceImpl(),
  );
}
