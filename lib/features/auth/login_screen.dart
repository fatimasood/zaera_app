import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/constant.dart';
import 'package:zaera_app/core/themes/colors.dart';
import 'package:zaera_app/features/auth/auth_controller.dart';
import 'package:zaera_app/services/profile_service.dart';
import 'package:zaera_app/widgets/custom_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //Auth Servicds
  final authServices = AuthController();

  void login() async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty || !email.contains("@gmail.com")) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter proper email and password")),
      );
      return;
    }

    try {
      final response = await authServices.signInWithEmailPassword(
        email,
        password,
      );
      if (response.user != null) {
        context.goNamed('home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Try Again... !! Login Failed ")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Try Again... !! Login Failed ")));
    }
  }

  bool rememberMe = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                      controller: emailController,
                      label: 'Email',
                      hint: 'Your registered mail...',
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomInput(
                      label: 'Password',
                      hint: 'Enter your password...',
                      obscureText: true,
                      controller: passwordController,
                    ),

                    const SizedBox(height: 3.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: rememberMe,
                              onChanged: (val) {
                                setState(() {
                                  rememberMe = val ?? false;
                                });
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
                          login();
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
