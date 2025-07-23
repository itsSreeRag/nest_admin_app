import 'package:flutter/material.dart';
import 'package:nest_admin_app/views/dashboard_page/dashboard_page_main.dart';
import 'package:nest_admin_app/views/hotel_list_page/hotel_list_page_main.dart';
import 'package:nest_admin_app/views/new_dashboard/new_dashboard.dart';
import 'package:nest_admin_app/views/permission_page/permssion_main.dart';
import 'package:nest_admin_app/views/report_page/report_page_main.dart';
import 'package:sidebarx/sidebarx.dart';

class SideBarScreens extends StatelessWidget {
  const SideBarScreens({super.key, required this.controller});

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return MyDashboardMain();
          case 1:
            return HotelListPageMain();
          case 2:
            return PermissionMain();
          case 3:
            return ReportListPage();
          default:
            return Text(pageTitle, style: theme.textTheme.headlineSmall);
        }
      },
    );
  }
}
