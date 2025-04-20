abstract class VerificationStatusState {}

class VerificationStatusInitial extends VerificationStatusState {}

class VerificationStatusLoading extends VerificationStatusState {}

class VerificationStatusSuccess extends VerificationStatusState {}

class VerificationStatusError extends VerificationStatusState {
  final String message;
  VerificationStatusError(this.message);
}