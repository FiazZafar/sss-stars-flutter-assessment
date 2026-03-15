import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:sss_stars_flutter_assessment/mvvm/views/auth_page.dart';
import 'package:sss_stars_flutter_assessment/mvvm/views/homePage.dart';

class AppRoutes {
  AppRoutes._();
  static final String authPage = '/';
  static final String homePage = '/homePage';

  static final GoRouter router = GoRouter(
    initialLocation: authPage,
    
    routes: [
      GoRoute(path: authPage, builder: (context, state) => AuthPage()),
      GoRoute(path: homePage, builder: (context, state) => Homepage()),
    ],
  );
}
