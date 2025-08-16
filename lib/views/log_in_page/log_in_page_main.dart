import 'package:flutter/material.dart';
import 'package:nest_admin_app/views/log_in_page/widgets/image_area.dart';
import 'package:nest_admin_app/views/log_in_page/widgets/login_area.dart';

class LoginPageMain extends StatelessWidget {
  const LoginPageMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;

          if (isMobile) {
            return Center(child: LoginArea());
          } else {
            return Row(
              children: const [
                Expanded(child: LoginArea()),
                Expanded(child: ImageArea()),
              ],
            );
          }
        },
      ),
    );
  }
}
