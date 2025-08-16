import 'package:flutter/material.dart';
import 'package:nest_admin_app/views/dashboard_page/widgets/analytics_overview.dart';
import 'package:nest_admin_app/views/dashboard_page/widgets/calender_section.dart';
import 'package:nest_admin_app/views/dashboard_page/widgets/dash_web_carousel_section.dart';
import 'package:nest_admin_app/views/dashboard_page/widgets/dash_web_hotel_management.dart';
import 'package:nest_admin_app/views/dashboard_page/widgets/dash_web_quick_status.dart';

class DashboardMobPageMain extends StatelessWidget {
  const DashboardMobPageMain({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DashWebCarouselSection(),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Overview',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(children: [SizedBox(width: 10), SizedBox(width: 10)]),
              ],
            ),
          ),
          const SizedBox(height: 20),
          DashboardQuickStats(),
          SizedBox(width: 10),
          DashWebAnalyticsOverview(),
          SizedBox(width: 10),
          CalendarSection(),
          SizedBox(width: 10),
          DashWebHotelManagement(),
        ],
      ),
    );
  }
}
