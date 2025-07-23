import 'package:flutter/material.dart';
import 'package:nest_admin_app/views/dashboard/analytics_overview/analytics_overview.dart';
import 'package:nest_admin_app/views/dashboard/analytics_overview/calender_section.dart';
import 'package:nest_admin_app/views/dashboard/status_info_card/status_info_card_list.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: _getResponsivePadding(context),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: _getResponsiveSpacing(context)),
            StatusInfoCardList(),
            SizedBox(height: _getResponsiveSpacing(context)),
            _buildAnalyticsSection(context),
            SizedBox(height: _getResponsiveSpacing(context)),
            // HotelsList(),
          ],
        ),
      ),
    );
  }

  EdgeInsets _getResponsivePadding(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    if (screenWidth >= desktopBreakpoint) {
      return const EdgeInsets.all(32);
    } else if (screenWidth >= tabletBreakpoint) {
      return const EdgeInsets.all(24);
    } else {
      return const EdgeInsets.all(16);
    }
  }

  double _getResponsiveSpacing(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    if (screenWidth >= desktopBreakpoint) {
      return 32;
    } else if (screenWidth >= tabletBreakpoint) {
      return 24;
    } else {
      return 16;
    }
  }

  Widget _buildAnalyticsSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    if (screenWidth >= desktopBreakpoint) {
      // Large Desktop: Analytics takes more space (3:1 ratio)
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(flex: 3, child: DashWebAnalyticsOverview()),
          const SizedBox(width: 24),
          const Expanded(flex: 1, child: CalendarSection()),
        ],
      );
    } else if (screenWidth >= tabletBreakpoint) {
      // Desktop/Large Tablet: Balanced layout (2:1 ratio)
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(flex: 2, child: DashWebAnalyticsOverview()),
          const SizedBox(width: 16),
          const Expanded(flex: 1, child: CalendarSection()),
        ],
      );
    } else if (screenWidth >= mobileBreakpoint) {
      // Small Tablet: Equal width side by side
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(child: DashWebAnalyticsOverview()),
          const SizedBox(width: 12),
          const Expanded(child: CalendarSection()),
        ],
      );
    } else {
      // Mobile: Stacked vertically
      return Column(
        children: [
          const DashWebAnalyticsOverview(),
          SizedBox(height: _getResponsiveSpacing(context)),
          const CalendarSection(),
        ],
      );
    }
  }
}