import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Column(
      children: [
        Row(
          children: [
            Text(
              "FlockStay",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Column(children: [
              Text("Current Location"),
              Row(children: [
                Icon(Icons.location_on),
              ])
            ])
          ],
        ),
      ],
    ));
  }
}
