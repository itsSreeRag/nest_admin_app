import 'package:flutter/material.dart';
import 'package:nest_admin_app/views/log_in_page/widgets/login_page_field.dart';
import 'package:nest_admin_app/views/log_in_page/widgets/login_page_heading.dart';
import 'package:nest_admin_app/views/log_in_page/widgets/login_page_title.dart';

class LoginArea extends StatelessWidget {
  const LoginArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              LoginPagetitle(),

              SizedBox(height: 20),

              LoginPageHeading(),
              LoginPageFields(),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
