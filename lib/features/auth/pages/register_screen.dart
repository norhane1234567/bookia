import 'package:flutter/material.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/utils/validators.dart';
import 'package:bookia/features/auth/widgets/auth_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  bool isPasswordHidden = true;
  bool isConfirmHidden = true;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
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
                  "Hello! Register to get\nstarted",
                  style: AppTextStyles.h1.copyWith(height: 1.3),
                ),

                const SizedBox(height: 40),

                /// Username
                AuthTextField(
                  hint: "Username",
                  controller: usernameController,
                  validator: AppValidators.username,
                ),

                const SizedBox(height: 20),

                /// Email
                AuthTextField(
                  hint: "Email",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: AppValidators.email,
                ),

                const SizedBox(height: 20),

                /// Password
                AuthTextField(
                  hint: "Password",
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

                const SizedBox(height: 20),

                /// Confirm Password
                AuthTextField(
                  hint: "Confirm password",
                  controller: confirmController,
                  isPassword: true,
                  isHidden: isConfirmHidden,
                  onToggle: () {
                    setState(() {
                      isConfirmHidden = !isConfirmHidden;
                    });
                  },
                  validator: (value) =>
                      AppValidators.confirmPassword(
                    value,
                    passwordController.text,
                  ),
                ),

                const SizedBox(height: 30),

                /// Register Button
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
                        print("Register Valid ");
                        
                      }
                    },
                    child: Text(
                      "Register",
                      style: AppTextStyles.button,
                    ),
                  ),
                ),

                const Spacer(),

                /// Bottom Text
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: AppTextStyles.bodyLarge,
                      children: [
                        TextSpan(
                          text: "Login Now",
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
  }
}