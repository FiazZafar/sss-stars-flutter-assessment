import 'package:go_router/go_router.dart';
import 'package:sss_stars_flutter_assessment/views/auth_page.dart';
import 'package:sss_stars_flutter_assessment/views/homePage.dart';

class AppRoutes {
  AppRoutes._();
  static final String authPage = '/';
  static final String homePage = '/homePage';

  static final GoRouter router = GoRouter(
    initialLocation: homePage,
    routes: [
      GoRoute(path: authPage, builder: (context, state) => AuthPage()),
      GoRoute(path: homePage, builder: (context, state) => Homepage()),
    ],
  );
}
