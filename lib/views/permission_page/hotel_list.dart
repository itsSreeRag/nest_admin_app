import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nest_admin_app/controllers/hotels/hotel_bloc.dart';
import 'package:nest_admin_app/controllers/hotels/hotel_event.dart';
import 'package:nest_admin_app/controllers/hotels/hotel_state.dart';
import 'package:nest_admin_app/controllers/hotel_repository.dart';
import 'package:nest_admin_app/views/permission_page/hotel_list_tile.dart';

class HotelListScreen extends StatelessWidget {
  const HotelListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HotelBloc(HotelRepository())..add(FetchHotels()),
      child: Scaffold(
        body: BlocBuilder<HotelBloc, HotelState>(
          builder: (context, state) {
            if (state is HotelLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is HotelLoaded) {
              return ListView.builder(
                itemCount: state.hotels.length,
                itemBuilder: (context, index) {
                  final hotel = state.hotels[index];
                  return HotelLiseTile(hotel: hotel,);
                },
              );
            } else if (state is HotelError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text('No Data'));
            }
          },
        ),
      ),
    );
  }
}
