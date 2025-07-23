import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nest_admin_app/services/hotel_repository.dart';
import 'package:nest_admin_app/controllers/hotels_bloc/hotel_event.dart';
import 'package:nest_admin_app/controllers/hotels_bloc/hotel_state.dart';
import 'package:nest_admin_app/models/hotel_model.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final HotelFirebaseServices repository;
  StreamSubscription<List<HotelModel>>? _hotelsSubscription;

  HotelBloc(this.repository) : super(HotelInitial()) {
    // Handle one-time fetch
    on<FetchHotels>((event, emit) async {
      emit(HotelLoading());
      try {
        final hotels = await repository.fetchHotelData();
        emit(HotelLoaded(hotels));
      } catch (e) {
        emit(HotelError(e.toString()));
      }
    });

    // Handle stream subscription
    on<SubscribeToHotels>((event, emit) async {
      emit(HotelLoading());

      await _hotelsSubscription?.cancel();
      _hotelsSubscription = repository.streamHotelData().listen(
        (hotels) => add(HotelsUpdated(hotels)),
        onError:
            (error) => emit(HotelError(error.toString())), // This line is fixed
      );
    });

    // Handle stream updates
    on<HotelsUpdated>((event, emit) {
      emit(HotelLoaded(event.hotels));
    });
  }

  @override
  Future<void> close() {
    _hotelsSubscription?.cancel();
    return super.close();
  }
}
