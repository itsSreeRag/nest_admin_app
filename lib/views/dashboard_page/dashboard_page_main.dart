import 'package:flutter/material.dart';
import 'package:nest_admin_app/views/dashboard_page/dashboard_mob_page/dashboard_mob_page_main.dart';
import 'package:nest_admin_app/views/dashboard_page/dashboard_web_page/dashboard_web_page_main.dart';

class MyDashboardMain extends StatelessWidget {
  const MyDashboardMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return const DashboardMobPageMain();
          } else {
            return const DashboardWebPageMain();
          }
        },
      ),
    );
  }
}
