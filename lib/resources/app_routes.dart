import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:sss_stars_flutter_assessment/mvvm/views/auth_page.dart';
import 'package:sss_stars_flutter_assessment/mvvm/views/homePage.dart';

class AppRoutes {
  AppRoutes._();

  static const String authPage = '/';
  static const String homePage = '/homePage';

  static final GoRouter router = GoRouter(
    initialLocation: authPage,

    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;

      // agar user logged-in hai
      if (user != null && state.matchedLocation == authPage) {
        return homePage;
      }

      // agar user logged-out hai
      if (user == null && state.matchedLocation == homePage) {
        return authPage;
      }

      return null;
    },

    routes: [
      GoRoute(
        path: authPage,
        builder: (context, state) => AuthPage(),
      ),
      GoRoute(
        path: homePage,
        builder: (context, state) => Homepage(),
      ),
    ],
  );
}