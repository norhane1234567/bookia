import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/utils/validators.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:bookia/features/auth/presentation/pages/forgot_password_screen.dart';

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
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {

    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    try {

      var result = await AuthRepo().login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      print(result);

      if (result["status"] == true || result["status"] == 200) {

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login Successful")),
        );

      } else {

        String message = result["message"] ?? "Login failed";

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message.toString())),
        );
      }

    } catch (e) {

      print(e);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Something went wrong")),
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
        child: SingleChildScrollView(
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
                    "Welcome back! Glad\nto see you, Again!",
                    style: AppTextStyles.h1.copyWith(height: 1.3),
                  ),

                  const SizedBox(height: 40),

                
                  AuthTextField(
                    hint: "Enter your email",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: AppValidators.email,
                  ),

                  const SizedBox(height: 20),

                 
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

                  const SizedBox(height: 10),

                
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                 
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
                      onPressed: isLoading ? null : login,
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                              "Login",
                              style: AppTextStyles.button,
                            ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  
                  Row(
                    children: [
                      Expanded(child: Divider(color: AppColors.greyBorder)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text("Or", style: AppTextStyles.bodyMedium),
                      ),
                      Expanded(child: Divider(color: AppColors.greyBorder)),
                    ],
                  ),

                  const SizedBox(height: 30),

                  socialButton(
                    text: "Sign in with Google",
                    icon: "assets/icons/google.svg",
                  ),

                  const SizedBox(height: 20),

                  socialButton(
                    text: "Sign in with Apple",
                    icon: "assets/icons/apple.svg",
                  ),

                  const SizedBox(height: 40),

                
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