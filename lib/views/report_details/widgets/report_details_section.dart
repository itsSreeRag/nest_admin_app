import 'package:flutter/material.dart';
import 'package:nest_admin_app/models/report_model.dart';
import 'detail_item.dart';

class ReportDetailsSection extends StatelessWidget {
  final ReportModel reportData;
  const ReportDetailsSection({super.key, required this.reportData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Row(
            children: [
              Icon(Icons.warning_amber_outlined,
                  color: Color(0xFFF59E0B), size: 20),
              SizedBox(width: 8),
              Text(
                'Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          DetailItem(
            icon: Icons.email_outlined,
            label:reportData. userName,
            value: reportData.userId,
          ),
          SizedBox(height: 20),
          DetailItem(
            icon: Icons.calendar_today_outlined,
            label: 'Report Date',
            value: '2025-01-15 10:39:08.514',
          ),
        ],
      ),
    );
  }
}
