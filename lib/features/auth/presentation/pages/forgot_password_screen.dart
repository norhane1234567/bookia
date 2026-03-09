import 'package:flutter/material.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/utils/validators.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:bookia/features/auth/presentation/pages/otp_verification_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void sendResetCode() {

    if (_formKey.currentState!.validate()) {

     
      print("Send reset code to ${emailController.text}");

     
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OtpVerificationScreen(
            email: emailController.text,
          ),
        ),
      );
    }
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),

                  const SizedBox(height: 40),

             
                  Text(
                    "Forgot Password?",
                    style: AppTextStyles.h1,
                  ),

                  const SizedBox(height: 10),

                
                  Text(
                    "Don't worry! It occurs. Please enter the email address linked with your account.",
                    style: AppTextStyles.bodyMedium,
                  ),

                  const SizedBox(height: 30),

               
                  AuthTextField(
                    hint: "Enter your email",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: AppValidators.email,
                  ),

                  const SizedBox(height: 30),

               
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: sendResetCode,
                      child: Text(
                        "Send Code",
                        style: AppTextStyles.button,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                 
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Remember Password? ",
                          style: AppTextStyles.bodyLarge,
                          children: [
                            TextSpan(
                              text: "Login",
                              style: AppTextStyles.bodyLarge.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
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