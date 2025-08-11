import 'package:flutter/material.dart';
import 'package:nest_admin_app/constants/colors.dart';

class LoginPageHeading extends StatelessWidget {
  const LoginPageHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Welcome back to ',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.black54,
              fontWeight: FontWeight.w400,
            ),
            children: [
              TextSpan(
                text: 'Nest Desk',
                style: TextStyle(
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 20),

        // Login title
        Text(
          'Login',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),

        SizedBox(height: 40),
      ],
    );
  }
}