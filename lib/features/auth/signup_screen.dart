import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zaera_app/core/constant.dart';
import 'package:zaera_app/database/user_database.dart';
import 'package:zaera_app/features/auth/auth_controller.dart';
import 'package:zaera_app/widgets/custom_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //database

  final userdatabase = UserDatabase();

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
  void dispose() {
    nameController.dispose();
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
                    const SizedBox(height: 20),

                    // HEADING
                    Text(
                      'Create an Account',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 30),

                    // INPUT FIELDS
                    CustomInput(
                      label: 'Name',
                      hint: 'User Name',
                      controller: nameController,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomInput(
                      label: 'Email',
                      hint: 'you@example.com',
                      controller: emailController,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomInput(
                      label: 'Password',
                      hint: 'Enter strong password...',
                      obscureText: true,
                      controller: passwordController,
                      onChanged: (val) {
                        setState(() {
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
                    const SizedBox(height: 50),

                    // BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: buttonHeight,
                      child: ElevatedButton(
                        onPressed: () async {
                          final authServices = AuthController();
                          if (kDebugMode) {
                            print(
                              "Email: ${emailController.text}, Password: ${passwordController.text}",
                            );
                          }

                          try {
                            final response = await authServices.signUp(
                              emailController.text,
                              passwordController.text,
                            );

                            if (kDebugMode) {
                              print(
                                "Sign up with: ${emailController.text}, Password: ${passwordController.text}",
                              );
                            }

                            if (response.user != null) {
                              // save email and name in user database
                              final user =
                                  Supabase.instance.client.auth.currentUser;
                              await Supabase.instance.client
                                  .from('zaera_users')
                                  .upsert({
                                    'id': user!.id,
                                    'name': nameController.text,
                                    'email': emailController.text,
                                  });

                              context.goNamed('home');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Your Account is not created due to any issue. Try again..!!",
                                  ),
                                ),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Error: ${e.toString()}",
                                  // "Error in creating your Account. Try again later..!!",
                                ),
                              ),
                            );
                            if (kDebugMode) {
                              print("Error: ${e.toString()}");
                            }
                          }
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
