import 'package:flockstay_mobile/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomerLayout extends StatelessWidget {
  final Widget childBody;
  final String currentScreen;

  const CustomerLayout(
      {super.key, required this.childBody, required this.currentScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childBody,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 20 / 2),
        height: 80,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              offset: const Offset(0, -10),
              blurRadius: 35,
              color: flockCyan.withOpacity(0.38))
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  if (currentScreen != "/home") {
                    context.goNamed("home");
                  }
                },
                icon: Icon(
                  MdiIcons.home,
                  size: 30,
                  color: currentScreen == "/home" ? flockCyan : Colors.black,
                )),
            IconButton(
                onPressed: () {
                  if (currentScreen != "/reservations") {
                    context.goNamed("reservations");
                  }
                },
                icon: Icon(
                  MdiIcons.listBox,
                  size: 30,
                  color: currentScreen == "/reservations"
                      ? flockCyan
                      : Colors.black,
                )),
            IconButton(
                onPressed: () {
                  if (currentScreen != "/notifications") {
                    context.goNamed("notifications");
                  }
                },
                icon: Icon(
                  MdiIcons.bell,
                  size: 30,
                  color: currentScreen == "/notifications"
                      ? flockCyan
                      : Colors.black,
                )),
            IconButton(
                onPressed: () {
                  if (currentScreen != "/profile") {
                    context.goNamed("profile");
                  }
                },
                icon: Icon(
                  MdiIcons.account,
                  size: 30,
                  color: currentScreen == "/profile" ? flockCyan : Colors.black,
                )),
          ],
        ),
      ),
    );
  }
}
