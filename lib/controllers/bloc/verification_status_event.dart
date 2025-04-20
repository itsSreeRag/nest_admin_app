abstract class VerificationStatusEvent {}

class UpdateVerificationStatus extends VerificationStatusEvent {
  final String hotelUid;
  final String newStatus;

  UpdateVerificationStatus({required this.hotelUid, required this.newStatus});
}
