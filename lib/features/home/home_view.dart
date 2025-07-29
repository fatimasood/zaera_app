import 'package:flutter/material.dart';
import 'package:zaera_app/features/home/widgets/greetings.dart';
import 'package:zaera_app/features/home/widgets/header.dart';
import 'package:zaera_app/features/home/widgets/shared_expenses.dart';
import 'package:zaera_app/features/home/widgets/updates.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            children: [
              SizedBox(height: 15),
              TopBarHeader(),
              SizedBox(height: 15),
              Greetings(),
              SizedBox(height: 20),
              SharedExpenses(),
              SizedBox(height: 15),
              Updates(),
            ],
          ),
        ),
      ),
    );
  }
}
