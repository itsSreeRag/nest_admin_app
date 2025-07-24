import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nest_admin_app/controllers/report_bloc/report_bloc.dart';
import 'package:nest_admin_app/controllers/report_bloc/report_event.dart';
import 'package:nest_admin_app/controllers/report_status_bloc/report_status_bloc.dart';

class ReportStatusCard extends StatelessWidget {
  final String satus;
  final String reportId;

  const ReportStatusCard({
    super.key,
    required this.satus,
    required this.reportId,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async{
        log('Approve pressed');
       context.read<ReportStatusBloc>().add(
              UpdateReportStatus(reportId: reportId, newStatus: 'Approve'),
            );

        context.read<ReportBloc>().add(FetchReports());
        Navigator.pop(context);
      },
      icon: const Icon(Icons.check_circle_outline, size: 18),
      label: const Text('Approve'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green[100],
        foregroundColor: Colors.green[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
