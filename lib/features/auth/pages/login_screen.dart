import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/utils/validators.dart';
import 'package:bookia/features/auth/widgets/auth_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordHidden = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const SizedBox(height: 20),

                        /// Back Button
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.greyBorder),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_ios_new_rounded),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),

                        const SizedBox(height: 40),

                        /// Title
                        Text(
                          "Welcome back! Glad\nto see you, Again!",
                          style: AppTextStyles.h1.copyWith(height: 1.3),
                        ),

                        const SizedBox(height: 40),

                        /// Email Field
                        AuthTextField(
                          hint: "Enter your email",
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: AppValidators.email,
                        ),

                        const SizedBox(height: 20),

                        /// Password Field
                        AuthTextField(
                          hint: "Enter your password",
                          controller: passwordController,
                          isPassword: true,
                          isHidden: isPasswordHidden,
                          onToggle: () {
                            setState(() {
                              isPasswordHidden = !isPasswordHidden;
                            });
                          },
                          validator: AppValidators.password,
                        ),

                        const SizedBox(height: 15),

                        /// Forgot Password
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot Password?",
                            style: AppTextStyles.bodyMedium,
                          ),
                        ),

                        const SizedBox(height: 30),

                        /// Login Button
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print("Login Valid");
                               
                              }
                            },
                            child: Text(
                              "Login",
                              style: AppTextStyles.button,
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        /// OR Divider
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: AppColors.greyBorder,
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                "Or",
                                style: AppTextStyles.bodyMedium,
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: AppColors.greyBorder,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),

                        /// Google Button
                        socialButton(
                          text: "Sign in with Google",
                          icon: "assets/icons/google.svg",
                        ),

                        const SizedBox(height: 20),

                        /// Apple Button
                        socialButton(
                          text: "Sign in with Apple",
                          icon: "assets/icons/apple.svg",
                        ),

                        const SizedBox(height: 40),

                        /// Register
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: "Don’t have an account? ",
                              style: AppTextStyles.bodyLarge,
                              children: [
                                TextSpan(
                                  text: "Register Now",
                                  style: AppTextStyles.bodyLarge.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget socialButton({required String text, required String icon}) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyBorder),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon, height: 24),
          const SizedBox(width: 12),
          Text(text, style: AppTextStyles.bodyMedium),
        ],
      ),
    );
  }
}