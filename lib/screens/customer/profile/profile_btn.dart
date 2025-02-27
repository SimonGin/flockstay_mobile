import 'package:flockstay_mobile/constants/colors.dart';
import 'package:flutter/material.dart';

class ProfileBtn extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onNavi;
  const ProfileBtn(
      {super.key,
      required this.title,
      required this.icon,
      required this.onNavi});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onNavi(),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(flockCyan.withOpacity(0.9)),
        shape: WidgetStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 15, top: 5, bottom: 5),
            child: Icon(icon, size: 30, color: Colors.white),
          ),
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Colors.white)),
        ],
      ),
    );
  }
}
