import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //admin + date
            Text("Admin:"),
            Text("Marium"),
          ],
        ),
      ],
    );
  }
}
