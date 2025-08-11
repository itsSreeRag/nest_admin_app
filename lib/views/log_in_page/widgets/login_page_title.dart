import 'package:flutter/material.dart';
import 'package:nest_admin_app/constants/colors.dart';

class LoginPagetitle extends StatelessWidget {
  const LoginPagetitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: Image.asset('assets/images/logo_nest.png'),
            ),
            SizedBox(width: 10),
            Text(
              'Nest Desk',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ],
    );
  }
}