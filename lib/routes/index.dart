import 'package:flockstay_mobile/screens/auth/login/scr.dart';
import 'package:flockstay_mobile/screens/auth/register/scr.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(initialLocation: "/auth/login", routes: [
  GoRoute(
      name: "login",
      path: "/auth/login",
      builder: (context, state) => LoginScreen()),
  GoRoute(
      name: "register",
      path: "/auth/register",
      builder: (context, state) => RegisterScreen()),
  GoRoute(name: "home", path: "/", builder: (context, state) => LoginScreen()),
]);
