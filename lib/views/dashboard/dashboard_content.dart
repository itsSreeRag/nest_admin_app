import 'package:flutter/material.dart';
import 'package:nest_admin_app/views/dashboard/dashboard_card.dart';
import 'package:nest_admin_app/views/dashboard/hotel_list.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Center(
            child: Text(
              'Hotel Management Overview',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
          ),
          const SizedBox(height: 24),
          DashboardCard(),
          const SizedBox(height: 24),
          HotelsList(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
