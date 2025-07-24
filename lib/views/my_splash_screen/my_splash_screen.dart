import 'package:flutter/material.dart';
import 'package:nest_admin_app/constants/colors.dart';
import 'package:nest_admin_app/views/log_in_page/log_in_page_main.dart';

class MySplashScreen extends StatelessWidget {
  const MySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => LoginPageMain()),
      );
    });
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'Nest',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
