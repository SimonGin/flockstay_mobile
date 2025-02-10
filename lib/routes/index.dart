import 'package:flutter/material.dart';
import 'package:flockstay_mobile/screens/auth/login/scr.dart';
import 'package:flockstay_mobile/screens/auth/register/scr.dart';
import 'package:flockstay_mobile/screens/customer/home/scr.dart';
import 'package:flockstay_mobile/screens/customer/layout.dart';
import 'package:flockstay_mobile/screens/customer/notifications/scr.dart';
import 'package:flockstay_mobile/screens/customer/profile/scr.dart';
import 'package:flockstay_mobile/screens/customer/reservations/scr.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: "/auth/login",
    routes: [
      GoRoute(
          name: "login",
          path: "/auth/login",
          builder: (context, state) => LoginScreen()),
      GoRoute(
          name: "register",
          path: "/auth/register",
          builder: (context, state) => RegisterScreen()),
      ShellRoute(
        navigatorKey: navigatorKey,
        routes: [
          GoRoute(
              name: "home",
              path: "/home",
              builder: (context, state) => const HomeScreen()),
          GoRoute(
              name: "reservations",
              path: "/reservations",
              builder: (context, state) => const ReservationsScreen()),
          GoRoute(
              name: "notifications",
              path: "/notifications",
              builder: (context, state) => const NotificationsScreen()),
          GoRoute(
              name: "profile",
              path: "/profile",
              builder: (context, state) => const ProfileScreen()),
        ],
        builder: (context, state, child) => CustomerLayout(
          childBody: child,
          currentScreen: state.matchedLocation,
        ),
      )
    ]);
