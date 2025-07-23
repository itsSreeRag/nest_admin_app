import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nest_admin_app/services/report_service.dart';
import 'report_event.dart';
import 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final ReportServices reportServices;

  ReportBloc(this.reportServices) : super(ReportInitial()) {
    on<FetchReportsByUserId>((event, emit) async {
      emit(ReportLoading());
      try {
        final reports = await reportServices.fetchReportsByUserId();
        emit(ReportLoaded(reports));
      } catch (e) {
        emit(ReportError('Failed to fetch reports'));
      }
    });
  }
}
