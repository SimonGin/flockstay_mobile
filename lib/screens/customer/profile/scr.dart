import 'package:flockstay_mobile/constants/colors.dart';
import 'package:flockstay_mobile/screens/customer/profile/profile_btn.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(children: [
        Icon(
          MdiIcons.accountCircle,
          size: 200,
          color: flockCyan,
        ),
        const Text("Simon Gin",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        const SizedBox(height: 30),
        Wrap(
          runSpacing: 20,
          children: [
            ProfileBtn(
              icon: MdiIcons.heart,
              title: "Favourites",
              onNavi: () {},
            ),
            ProfileBtn(
                icon: MdiIcons.accountEdit,
                title: "Edit Profile",
                onNavi: () {}),
            ProfileBtn(
                icon: MdiIcons.lockReset,
                title: "Reset Password",
                onNavi: () {}),
            ProfileBtn(
                icon: MdiIcons.logout,
                title: "Logout",
                onNavi: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.remove("access_token");
                  if (!context.mounted) return;
                  context.goNamed("login");
                }),
          ],
        )
      ]),
    ));
  }
}
