import 'package:go_router/go_router.dart';

import '../../features/home/pages/home_page.dart';
import '../../features/splash/splash_page.dart';

class AppRoutes {
  static final routerConfig = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
