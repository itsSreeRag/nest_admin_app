import 'package:flutter/material.dart';
import 'package:nest_admin_app/views/dashboard/dashboard_content.dart';
import 'package:nest_admin_app/views/dashboard/drawer.dart';

class HotelAdminDashboard extends StatelessWidget {
  const HotelAdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar:
          isDesktop
              ? null
              : AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black),
                  onPressed: () {},
                ),
                title: const Text(
                  'Nest Admin',
                  style: TextStyle(color: Colors.black),
                ),
              ),
      drawer: MyDrawer(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isDesktop) SizedBox(width: 250, child: MyDrawer()),
          Expanded(
            child: DashboardContent(),
            // child:PermissionMain()
          ),
        ],
      ),
    );
  }
}
