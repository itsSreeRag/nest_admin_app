import 'package:nest_admin_app/models/registration_model.dart';

abstract class HotelEvent {}

class FetchHotels extends HotelEvent {
  FetchHotels();
}

// Add a new event for stream subscription
class SubscribeToHotels extends HotelEvent {}

// Add a new event for handling updates
class HotelsUpdated extends HotelEvent {
  final List<RegistrationModel> hotels;

  HotelsUpdated(this.hotels);
}
