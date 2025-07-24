import 'package:bloc/bloc.dart';
import 'package:nest_admin_app/services/report_service.dart';
part 'report_status_event.dart';
part 'report_status_state.dart';

class ReportStatusBloc extends Bloc<ReportStatusEvent, ReportStatusState> {
  final ReportServices reportServices;

  ReportStatusBloc(this.reportServices) : super(ReportStatusInitial()) {
    on<UpdateReportStatus>((event, emit) async {
      emit(ReportStatusLoading());
      try {
        await reportServices.updateReportStatus(
          event.reportId,
          event.newStatus,
        );
        emit(ReportStatusSuccess());
      } catch (e) {
        emit(ReportStatusError(e.toString()));
      }
    });
  }
}
