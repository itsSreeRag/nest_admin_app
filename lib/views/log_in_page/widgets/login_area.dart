import 'package:flutter/material.dart';
import 'package:nest_admin_app/views/log_in_page/widgets/login_page_field.dart';
import 'package:nest_admin_app/views/log_in_page/widgets/login_page_heading.dart';
import 'package:nest_admin_app/views/log_in_page/widgets/login_page_title.dart';

class LoginArea extends StatelessWidget {
  const LoginArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginPagetitle(),
        
            Spacer(),
            LoginPageHeading(),
        
            LoginPageFields(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}




