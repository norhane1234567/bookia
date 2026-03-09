import 'package:flutter/material.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/auth/presentation/pages/reset_password_screen.dart';

class OtpVerificationScreen extends StatefulWidget {

  final String email;

  const OtpVerificationScreen({
    super.key,
    required this.email,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

  final List<TextEditingController> controllers =
      List.generate(6, (_) => TextEditingController());

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void verifyOtp() {

    String otp = controllers
        .map((controller) => controller.text)
        .join();

    print("OTP Code: $otp");

    if (otp.length == 6) {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResetPasswordScreen(
            email: widget.email,
          ),
        ),
      );

    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter the full OTP code"),
        ),
      );

    }
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
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              const SizedBox(height: 40),

           
              Text(
                "OTP Verification",
                style: AppTextStyles.h1,
              ),

              const SizedBox(height: 10),

             
              Text(
                "Enter the verification code we just sent on your email address.",
                style: AppTextStyles.bodyMedium,
              ),

              const SizedBox(height: 40),

            
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {

                  return SizedBox(
                    width: 50,
                    child: TextField(
                      controller: controllers[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyLarge,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: "",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            color: AppColors.primary,
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            color: AppColors.primary,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  );

                }),
              ),

              const SizedBox(height: 40),

            
              MainButton(
                text: "Verify",
                onPressed: verifyOtp,
              ),

              const Spacer(),

            
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Didn’t received code? ",
                    style: AppTextStyles.bodyLarge,
                    children: [
                      TextSpan(
                        text: "Resend",
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
    );
  }
}