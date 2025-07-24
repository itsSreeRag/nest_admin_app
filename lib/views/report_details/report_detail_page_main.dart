import 'package:flutter/material.dart';
import 'package:nest_admin_app/models/report_model.dart';
import 'package:nest_admin_app/views/report_details/widgets/hotel_id_block.dart';
import 'package:nest_admin_app/views/report_details/widgets/report_details_section.dart';
import 'package:nest_admin_app/views/report_details/widgets/report_reason_section.dart';
import 'package:nest_admin_app/views/report_details/widgets/report_status_card.dart';

class ReportDetailsPage extends StatelessWidget {
  final ReportModel reportData;
  const ReportDetailsPage({super.key, required this.reportData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Report Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.search, size: 18),
              label: const Text('Search'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B82F6),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: PopupMenuButton(
              icon: const Icon(Icons.account_circle, color: Colors.grey),
              itemBuilder:
                  (context) => [
                    const PopupMenuItem(
                      value: 'profile',
                      child: Text('Profile'),
                    ),
                  ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HotelIdBlock(hotelId: reportData.hotelId),
            SizedBox(height: 20),
            SizedBox(
              width: 150,
              child: ReportStatusCard(
                reportId: reportData.reportId,
                satus: reportData.status,
              ),
            ),
            SizedBox(height: 32),
            ReportReasonSection(reportData: reportData),
            SizedBox(height: 24),
            ReportDetailsSection(reportData: reportData),
          ],
        ),
      ),
    );
  }
}
