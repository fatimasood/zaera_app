import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    //final screenWidth = MediaQuery.of(context).size.width;

    final logoSize = screenHeight * 0.2;
    final buttonHeight = screenHeight * 0.06; // 6% height

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'lib/assets/images/logo.png',
                width: logoSize,
                height: logoSize,
              ),
              const SizedBox(height: 15),
              Text(
                'Create an Account',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 20),

              // Input fields for email and password
              SizedBox(
                width: double.infinity,
                height: buttonHeight,
                child: ElevatedButton(
                  onPressed: () {
                    // signup logic
                  },
                  child: Text(
                    "Let's Go!",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
