import 'package:flockstay_mobile/components/auth/input_field.dart';
import 'package:flockstay_mobile/constants/colors.dart';
import 'package:flockstay_mobile/apis/auth/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController phoneCtrlr = TextEditingController();
  final TextEditingController passwordCtrlr = TextEditingController();

  LoginScreen({super.key, passwordController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
        child: Column(
          children: [
            RichText(
                text: const TextSpan(
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    children: [
                  TextSpan(
                    text: "Welcome ",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: "Back",
                    style: TextStyle(color: flockCyan),
                  )
                ])),
            const SizedBox(height: 10),
            Text(
              "We've missed you! Sign in to continue your journey with us",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black.withOpacity(0.55)),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(children: [
                InputField(
                    controller: phoneCtrlr,
                    placeholder: "Enter your phone",
                    prefixIcon: Icons.phone),
                const SizedBox(height: 20),
                InputField(
                  controller: passwordCtrlr,
                  placeholder: "Enter your password",
                  prefixIcon: Icons.lock,
                  isPassword: true,
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  width: double.infinity,
                  child: Text("Forgot Password?",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: flockCyan, fontWeight: FontWeight.w500)),
                )
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  login(phoneCtrlr.text, passwordCtrlr.text);
                },
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(flockCyan),
                  shape: WidgetStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10)), // Sharp corners
                    ),
                  ),
                ),
                child: const Text("Login",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey, // Line color
                    thickness: 1, // Line thickness
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Or continue with",
                    style: TextStyle(
                      color: Colors.grey, // Text color
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey, // Line color
                    thickness: 1, // Line thickness
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/gg_icon.svg")),
            const SizedBox(height: 20),
            RichText(
                text: TextSpan(
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16),
                    children: [
                  TextSpan(
                    text: "First time here? ",
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                  TextSpan(
                    text: "Sign Up",
                    style: const TextStyle(color: flockCyan),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.goNamed("register");
                      },
                  )
                ])),
          ],
        ),
      )),
    );
  }
}
