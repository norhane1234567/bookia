import 'package:flutter/material.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/auth/presentation/pages/success_screen.dart';

class ResetPasswordScreen extends StatefulWidget {

  final String email;

  const ResetPasswordScreen({
    super.key,
    required this.email,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void resetPassword() {

    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (password.isEmpty || confirmPassword.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );

      return;
    }

    if (password != confirmPassword) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match")),
      );

      return;
    }

    print("Reset password for: ${widget.email}");

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SuccessScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
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
                "Create New Password",
                style: AppTextStyles.h1,
              ),

              const SizedBox(height: 10),

            
              Text(
                "Your new password must be different from previously used password.",
                style: AppTextStyles.bodyMedium,
              ),

              const SizedBox(height: 40),

              
              TextField(
                controller: passwordController,
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  hintText: "New Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

             
              TextField(
                controller: confirmPasswordController,
                obscureText: obscureConfirmPassword,
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureConfirmPassword =
                            !obscureConfirmPassword;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 40),

              
              MainButton(
                text: "Reset Password",
                onPressed: resetPassword,
              ),

            ],
          ),
        ),
      ),
    );
  }
}