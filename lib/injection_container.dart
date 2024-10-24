import 'package:get_it/get_it.dart';

import 'core/utils/app_router.dart';
import 'features/events/data/data_sources/remote/events_remote_data_source.dart';
import 'features/events/data/repositories/events_repository_impl.dart';
import 'features/events/domain/repositories/events_repository.dart';
import 'features/events/domain/use_cases/get_events_use_case.dart';
import 'features/events/domain/use_cases/join_event_use_case.dart';
import 'features/events/presentation/cubits/get_events_cubit.dart';
import 'features/events/presentation/cubits/join_event_cubit.dart';

final sl = GetIt.instance;

void init() {
  //* Features - Events
  //! Cubits
  sl.registerLazySingleton(() => GetEventsCubit(getEventsUseCase: sl()));
  sl.registerLazySingleton(() => JoinEventCubit(joinEventUseCase: sl()));

  //! Use Cases
  sl.registerLazySingleton(() => GetEventsUseCase(repository: sl()));
  sl.registerLazySingleton(() => JoinEventUseCase(repository: sl()));

  //! Repositories
  sl.registerLazySingleton<EventsRepository>(
    () => EventsRepositoryImpl(remoteDataSource: sl()),
  );

  //! Data sources
  sl.registerLazySingleton<EventsRemoteDataSource>(
    () => EventsRemoteDataSourceImpl(),
  );

  //! External
  sl.registerSingleton(AppRouter());
}
