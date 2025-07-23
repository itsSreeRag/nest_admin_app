import 'package:flutter/material.dart';
import 'package:nest_admin_app/views/dashboard_page/dashboard_web_page/widgets/dash_web_hotel_management.dart';
import 'package:nest_admin_app/views/dashboard_page/widgets/analytics_overview.dart';
import 'package:nest_admin_app/views/dashboard_page/widgets/calender_section.dart';
import 'package:nest_admin_app/views/dashboard_page/dashboard_web_page/widgets/dash_web_carousel_section.dart';
import 'package:nest_admin_app/views/dashboard_page/widgets/dash_web_quick_status.dart';
import 'package:nest_admin_app/views/dashboard_page/dashboard_web_page/widgets/dashboard_web_nav_bar.dart';

class DashboardWebPageMain extends StatelessWidget {
  const DashboardWebPageMain({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const DashWebNavBar(),
          const SizedBox(height: 24),
          DashWebCarouselSection(),
          const SizedBox(height: 24),
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
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: DashWebAnalyticsOverview()),
                    SizedBox(width: 24),
                    Expanded(child: CalendarSection()),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          DashWebHotelManagement(),
        ],
      ),
    );
  }
}
