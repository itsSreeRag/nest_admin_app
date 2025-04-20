import 'package:flutter/material.dart';
import 'package:nest_admin_app/views/log_in_page/login_page_card.dart';

class LoginPageMain extends StatelessWidget {
  const LoginPageMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/hoteal.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final isWeb = constraints.maxWidth > 600;

              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: isWeb ? 500 : constraints.maxWidth * 0.9,
                  child: LoginPageCard(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
