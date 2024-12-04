import 'package:flockstay_mobile/components/auth/input_field.dart';
import 'package:flockstay_mobile/constants/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  TextEditingController phoneCtrlr = TextEditingController();
  TextEditingController passwordCtrlr = TextEditingController();
  RegisterScreen({super.key, phoneCtrlr, passwordCtrlr});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    text: "Join us ",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: "Today",
                    style: TextStyle(color: flockCyan),
                  )
                ])),
            const SizedBox(height: 10),
            Text(
              "Start your journey to discover extraordinary stays by signing up now",
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
                    controller: phoneCtrlr,
                    placeholder: "Enter your username",
                    prefixIcon: Icons.person),
                const SizedBox(height: 20),
                InputField(
                  controller: passwordCtrlr,
                  placeholder: "Enter your password",
                  prefixIcon: Icons.lock,
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                InputField(
                  controller: passwordCtrlr,
                  placeholder: "Confirm your password",
                  prefixIcon: Icons.lock,
                  isPassword: true,
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(flockCyan),
                  shape: WidgetStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10)), // Sharp corners
                    ),
                  ),
                ),
                child: const Text("Register",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
            RichText(
                text: TextSpan(
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16),
                    children: [
                  TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                  const TextSpan(
                    text: "Sign In",
                    style: TextStyle(color: flockCyan),
                  )
                ])),
          ],
        ),
      )),
    );
  }
}
