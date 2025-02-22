import 'package:flockstay_mobile/screens/customer/hotel_info/scr.dart';
import 'package:flutter/material.dart';
import 'package:flockstay_mobile/screens/auth/login/scr.dart';
import 'package:flockstay_mobile/screens/auth/register/scr.dart';
import 'package:flockstay_mobile/screens/customer/home/scr.dart';
import 'package:flockstay_mobile/screens/customer/layout.dart';
import 'package:flockstay_mobile/screens/customer/notifications/scr.dart';
import 'package:flockstay_mobile/screens/customer/profile/scr.dart';
import 'package:flockstay_mobile/screens/customer/reservations/scr.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> customerShellKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
    navigatorKey: rootNavigatorKey,
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
        navigatorKey: customerShellKey,
        routes: [
          GoRoute(
              name: "home",
              path: "/home",
              parentNavigatorKey: customerShellKey,
              builder: (context, state) => const HomeScreen(),
              routes: [
                GoRoute(
                  name: "hotels",
                  path: "/hotels",
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) => const HotelInfoScreen(),
                )
              ]),
          GoRoute(
              name: "reservations",
              path: "/reservations",
              parentNavigatorKey: customerShellKey,
              builder: (context, state) => const ReservationsScreen()),
          GoRoute(
              name: "notifications",
              path: "/notifications",
              parentNavigatorKey: customerShellKey,
              builder: (context, state) => const NotificationsScreen()),
          GoRoute(
              name: "profile",
              path: "/profile",
              parentNavigatorKey: customerShellKey,
              builder: (context, state) => const ProfileScreen()),
        ],
        builder: (context, state, child) => CustomerLayout(
          childBody: child,
          currentScreen: state.matchedLocation,
        ),
      )
    ]);
