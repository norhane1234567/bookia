import 'package:flutter/material.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/auth/presentation/pages/login_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              
              Image.asset(
                "assets/images/successmark.png",
                height: 120,
              ),

              const SizedBox(height: 30),

             
              Text(
                "Password Changed!",
                style: AppTextStyles.h1,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

             
              Text(
                "Your password has been changed successfully.",
                style: AppTextStyles.bodyMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

            
              MainButton(
                text: "Back to Login",
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}