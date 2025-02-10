import 'package:flockstay_mobile/constants/colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String placeholder;
  final IconData prefixIcon;
  final bool isPassword;

  const InputField(
      {super.key,
      required this.controller,
      required this.placeholder,
      required this.prefixIcon,
      this.isPassword = false});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: flockCyan),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller,
              obscureText: !isPasswordVisible && widget.isPassword,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                prefixIcon: Icon(widget.prefixIcon),
                prefixIconColor: flockCyan, // Replace with `flockCyan`
                hintText: widget.placeholder,
                hintStyle: const TextStyle(color: Colors.grey),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          if (widget.isPassword)
            IconButton(
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: flockCyan,
              ),
            ),
        ],
      ),
    );
  }
}
