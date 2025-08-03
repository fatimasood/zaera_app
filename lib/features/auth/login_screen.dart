import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/constant.dart';
import 'package:zaera_app/core/themes/colors.dart';
import 'package:zaera_app/widgets/custom_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final logoSize = screenHeight * 0.2;
    final buttonHeight = screenHeight * 0.06;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                      'Hey Fatema',
                      style: GoogleFonts.urbanist(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.brown,
                      ),
                    ),
                    SizedBox(height: 0.5),
                    Text(
                      'Welcome Back',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 30),

                    CustomInput(
                      label: 'Email',
                      hint: 'Your registered mail...',
                      onChanged: (val) {},
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomInput(
                      label: 'Password',
                      hint: 'Enter your password...',
                      obscureText: true,
                      onChanged: (val) {},
                    ),

                    const SizedBox(height: 3.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (val) {
                                //logic here
                              },
                            ),

                            Text(
                              "Remember Me",
                              style: GoogleFonts.inter(
                                color: AppColors.tealGreen,
                                fontSize: 12.5,
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 7.0),
                            child: GestureDetector(
                              onTap: () {
                                // Reset Password
                              },
                              child: Text(
                                "Reset Password",
                                style: GoogleFonts.inter(
                                  color: AppColors.tealGreen,
                                  fontSize: 12.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 50),

                    // BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: buttonHeight,
                      child: ElevatedButton(
                        onPressed: () {
                          context.goNamed('home');
                        },
                        child: Text(
                          "Log In",
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
                    TextConstants.noAcc,
                    style: TextConstants.alreadyAccstyle,
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      context.goNamed('signup');
                    },
                    child: Text(
                      TextConstants.signup,
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
