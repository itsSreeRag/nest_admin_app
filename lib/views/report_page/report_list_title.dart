import 'package:flutter/material.dart';
import 'package:nest_admin_app/models/report_model.dart';
import 'package:nest_admin_app/constants/colors.dart';

class ReportListTile extends StatelessWidget {
  final ReportModel report;
  const ReportListTile({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.background,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // User name
            Expanded(
              flex: 2,
              child: Text(
                report.userName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            // Report Title
            Expanded(
              flex: 3,
              child: Text(
                report.title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),

            // Report Description
            Expanded(
              flex: 4,
              child: Text(
                report.description,
                style: TextStyle(color: Colors.grey[700]),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),

            const SizedBox(width: 10),

            // Status (Approved, Pending, Blocked)
            StatusChip(status: report.status),

            const SizedBox(width: 10),

            // Date
            Expanded(
              flex: 2,
              child: Text(
                _formatDate(report.createdAt),
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

class StatusChip extends StatelessWidget {
  final String status;
  const StatusChip({super.key, required this.status});

  Color getStatusColor() {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'approve':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: getStatusColor().withAlpha(200),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          status,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
