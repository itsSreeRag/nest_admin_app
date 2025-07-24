part of 'report_status_bloc.dart';

class ReportStatusState {}

final class ReportStatusInitial extends ReportStatusState {}

class ReportStatusLoading extends ReportStatusState {}

class ReportStatusSuccess extends ReportStatusState {}

 class ReportStatusError extends ReportStatusState {
  final String message;
  ReportStatusError(this.message);
}
