import 'package:flutter/material.dart';
import 'package:zaera_app/features/home/widgets/greetings.dart';
import 'package:zaera_app/features/home/widgets/header.dart';
import 'package:zaera_app/features/home/widgets/shared_expenses.dart';
import 'package:zaera_app/features/home/widgets/updates.dart';

class HomeView extends StatelessWidget {
  final String userName;
  const HomeView({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double spacing(double factor) => screenHeight * factor;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.03,
              vertical: screenHeight * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBarHeader(),
                SizedBox(height: spacing(0.02)),
                Greetings(userName: userName),
                SizedBox(height: spacing(0.02)),
                SharedExpenses(),
                SizedBox(height: spacing(0.015)),
                Updates(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
