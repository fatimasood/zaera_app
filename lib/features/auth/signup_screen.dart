import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/constant.dart';
import 'package:zaera_app/widgets/custom_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String password = '';
  String passwordStrength = 'Set Strong Password..!!';

  Color getStrengthColor(String strength) {
    switch (strength) {
      case 'Uncrackable :)':
        return Colors.purple;
      case 'Kinda Safe :|':
        return Colors.orange;

      case 'Too Soft :(':
        return Colors.pinkAccent;
      default:
        return Colors.red;
    }
  }

  String checkPasswordStrength(String password) {
    bool hasUpper = password.contains(RegExp(r'[A-Z]'));
    bool hasLower = password.contains(RegExp(r'[a-z]'));
    bool hasDigit = password.contains(RegExp(r'[0-9]'));
    bool hasSpecial = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    int strength =
        [hasUpper, hasLower, hasDigit, hasSpecial].where((e) => e).length;

    if (password.length >= 8 && strength == 4) return 'Uncrackable :)';
    if (password.length >= 6 && strength >= 2) return 'Kinda Safe :|';
    if (password.isNotEmpty && strength >= 1) return 'Too Soft :(';
    return 'Set Strong Password..!!';
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final logoSize = screenHeight * 0.2;
    final buttonHeight = screenHeight * 0.06;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
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

                    // INPUT FIELDS
                    customInput(
                      label: 'Name',
                      hint: 'User',
                      onChanged: (val) {},
                    ),
                    const SizedBox(height: 15),
                    customInput(
                      label: 'Email',
                      hint: 'you@example.com',
                      onChanged: (val) {},
                    ),
                    const SizedBox(height: 15),
                    customInput(
                      label: 'Password',
                      hint: 'Enter strong password...',
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                          passwordStrength = checkPasswordStrength(val);
                        });
                      },
                    ),

                    const SizedBox(height: 10.0),
                    // Password Strength
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 7.0),
                        child: Text(
                          passwordStrength,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: getStrengthColor(passwordStrength),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: buttonHeight,
                      child: ElevatedButton(
                        onPressed: () {
                          // signup logic
                        },
                        child: Text(
                          "Sign Up",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // FOOTER
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    TextConstants.alreadyAcc,
                    style: TextConstants.alreadyAccstyle,
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      // Navigate to login
                      context.goNamed('login');
                    },
                    child: Text(
                      TextConstants.login,
                      style: TextConstants.logmeinStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
