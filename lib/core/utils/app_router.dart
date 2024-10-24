import 'package:go_router/go_router.dart';

import '../../features/events/domain/entities/event.dart';
import '../../features/events/presentation/screens/event_details_screen.dart';
import '../../features/events/presentation/screens/events_list_screen.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: EventsListScreen.route,
    routes: [
      GoRoute(
        name: EventsListScreen.route,
        path: EventsListScreen.route,
        builder: (_, __) => const EventsListScreen(),
        routes: [
          GoRoute(
            name: EventDetailsScreen.route,
            path: EventDetailsScreen.route,
            builder: (_, state) => EventDetailsScreen(
              event: state.extra as Event,
            ),
          ),
        ],
      ),
    ],
  );
}
