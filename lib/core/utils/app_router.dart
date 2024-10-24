import 'package:go_router/go_router.dart';

import '../../features/events/presentation/screens/events_list_screen.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: EventsListScreen.route,
    routes: [
      GoRoute(
        name: EventsListScreen.route,
        path: EventsListScreen.route,
        builder: (context, state) => const EventsListScreen(),
      ),
    ],
  );
}
