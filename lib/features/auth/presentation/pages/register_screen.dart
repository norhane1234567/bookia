import 'package:flutter/material.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/utils/validators.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';

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

  bool isLoading = false;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  Future<void> register() async {

    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    try {

      var result = await AuthRepo().register(
        usernameController.text.trim(),
        emailController.text.trim(),
        passwordController.text.trim(),
        confirmController.text.trim(),
      );

      print(result);

      String message = "Something went wrong";

      if (result["message"] != null) {
        message = result["message"].toString();
      }

      if (result["errors"] != null) {
        message = result["errors"].toString();
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );

    } catch (e) {

      print(e);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Something went wrong"),
        ),
      );

    }

    setState(() {
      isLoading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(   // FIX OVERFLOW
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 20),

                  
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

                 
                  Text(
                    "Hello! Register to get\nstarted",
                    style: AppTextStyles.h1.copyWith(height: 1.3),
                  ),

                  const SizedBox(height: 40),

                 
                  AuthTextField(
                    hint: "Username",
                    controller: usernameController,
                    validator: AppValidators.username,
                  ),

                  const SizedBox(height: 20),

                 
                  AuthTextField(
                    hint: "Email",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: AppValidators.email,
                  ),

                  const SizedBox(height: 20),

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
                      onPressed: isLoading ? null : register,
                      child: isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Register",
                              style: AppTextStyles.button,
                            ),
                    ),
                  ),

                  const SizedBox(height: 40),

                 
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
      ),
    );
  }
}