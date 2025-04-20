import 'package:nest_admin_app/models/registration_model.dart';

abstract class HotelState {}

class HotelInitial extends HotelState {}

class HotelLoading extends HotelState {}

class HotelLoaded extends HotelState {
  final List<RegistrationModel> hotels;

  HotelLoaded(this.hotels);
}

class HotelError extends HotelState {
  final String message;

  HotelError(this.message);
}
