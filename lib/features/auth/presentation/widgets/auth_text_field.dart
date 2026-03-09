import 'package:flutter/material.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';

class AuthTextField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final bool isHidden;
  final VoidCallback? onToggle;

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const AuthTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.isHidden = false,
    this.onToggle,
    this.controller,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: isPassword ? isHidden : false,
      style: AppTextStyles.bodyLarge,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.bodyMedium,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isHidden
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: AppColors.greyText,
                ),
                onPressed: onToggle,
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: AppColors.greyBorder,
            width: 1.2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 1.8,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}