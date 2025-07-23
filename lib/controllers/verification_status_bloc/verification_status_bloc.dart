import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nest_admin_app/services/hotel_repository.dart';
import 'verification_status_event.dart';
import 'verification_status_state.dart';

class VerificationStatusBloc extends Bloc<VerificationStatusEvent, VerificationStatusState> {
  final HotelFirebaseServices repository;

  VerificationStatusBloc(this.repository) : super(VerificationStatusInitial()) {
    on<UpdateVerificationStatus>((event, emit) async {
      emit(VerificationStatusLoading());
      try {
        await repository.updateVerificationStatus(event.hotelUid, event.newStatus);
        emit(VerificationStatusSuccess());
      } catch (e) {
        emit(VerificationStatusError(e.toString()));
      }
    });
  }
}
