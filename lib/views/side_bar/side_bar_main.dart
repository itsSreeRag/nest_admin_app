import 'package:flutter/material.dart';
import 'package:nest_admin_app/constants/colors.dart';
import 'package:nest_admin_app/views/new_dashboard/new_dashboard.dart';
import 'package:nest_admin_app/views/side_bar/side_bar.dart';
import 'package:nest_admin_app/views/side_bar/side_bar_screen.dart';
import 'package:sidebarx/sidebarx.dart';

class SideBarMain extends StatelessWidget {
  SideBarMain({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final controller = SidebarXController(selectedIndex: 0, extended: true);

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: AppColors.background,
      key: _key,
      appBar:
          isSmallScreen
              ? AppBar(
                backgroundColor: AppColors.primary,
                title: Text(
                  getTitleByIndex(controller.selectedIndex),
                  style: TextStyle(color: AppColors.white),
                ),
                leading: IconButton(
                  onPressed: () {
                    _key.currentState?.openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                ),
              )
              : null,
      drawer: MySideBar(controller: controller),
      body: Row(
        children: [
          if (!isSmallScreen) MySideBar(controller: controller),
          Expanded(
            child: Center(child: SideBarScreens(controller: controller)),
          ),
        ],
      ),

    );
  }
}
