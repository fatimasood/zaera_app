import 'package:flutter/material.dart';
import 'package:zaera_app/core/constant.dart';
import 'package:zaera_app/core/themes/colors.dart';
import 'package:zaera_app/widgets/custom_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final logoSize = screenHeight * 0.2;
    final buttonHeight = screenHeight * 0.06;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // LOGO
              Image.asset(
                'lib/assets/images/logo.png',
                width: logoSize,
                height: logoSize,
              ),
              const SizedBox(height: 15),

              // HEADING
              Text(
                'Create an Account',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 30),

              // NAME FIELD
              customInput(label: 'Name', hint: 'Fatema'),
              const SizedBox(height: 20),

              // EMAIL FIELD
              customInput(label: 'Email', hint: 'you@example.com'),
              const SizedBox(height: 20),

              // PASSWORD FIELD
              customInput(
                label: 'Password',
                hint: 'Enter strong password...',
                obscureText: true,
              ),
              const SizedBox(height: 90),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (bool? newValue) {
                      // setstate
                    },
                    activeColor: AppColors.tealGreen,
                  ),
                  const SizedBox(width: 1.0),
                  Expanded(
                    child: Text(
                      TextConstants.terms,
                      style: TextConstants.termsStyle,
                    ),
                  ),
                ],
              ),
              // BUTTON
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

              const SizedBox(height: 40),

              // FOOTER
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    TextConstants.alreadyAcc,
                    style: TextConstants.alreadyAccstyle,
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      // go to login screen
                    },
                    child: Text(
                      TextConstants.login,
                      style: TextConstants.logmeinStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
