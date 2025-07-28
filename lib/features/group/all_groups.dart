import 'package:flutter/material.dart';

class AllGroups extends StatelessWidget {
  const AllGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: Text('Group View', style: TextStyle(fontSize: 24))),
      ),
    );
  }
}
