import 'package:go_router/go_router.dart';
import '../../Features/auth/presentation/pages/auth_page.dart';
import 'app_route_const.dart';

class MyAppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: MyAppRouteConst.authPage,
        path: '/',
        builder: (context, state) {
          return const AuthPage();
        },
      ),
    ],
  );
}
