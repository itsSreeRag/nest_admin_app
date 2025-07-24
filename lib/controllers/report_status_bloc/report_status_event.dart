part of 'report_status_bloc.dart';

class ReportStatusEvent {}

class UpdateReportStatus extends ReportStatusEvent {
  final String reportId;

  final String newStatus;

  UpdateReportStatus({required this.reportId, required this.newStatus});
}
