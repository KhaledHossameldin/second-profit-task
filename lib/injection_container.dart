import 'package:get_it/get_it.dart';

import 'features/events/data/data_sources/remote/events_remote_data_source.dart';

final sl = GetIt.instance;

void init() {
  //* Features - Events
  //! Cubits
  //! Use Cases
  //! Repositories
  //! Data sources
  sl.registerLazySingleton<EventsRemoteDataSource>(
    () => EventsRemoteDataSourceImpl(),
  );
}
