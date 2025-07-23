import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nest_admin_app/controllers/hotels_bloc/hotel_bloc.dart';
import 'package:nest_admin_app/controllers/hotels_bloc/hotel_state.dart';
import 'package:nest_admin_app/views/hotel_detail_pages/permission_details_screen_main.dart';
import 'package:nest_admin_app/views/permission_page/hotel_list_hedings.dart';
import 'package:nest_admin_app/views/permission_page/hotel_list_tile.dart';

class HotelListScreen extends StatelessWidget {
  const HotelListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HotelBloc, HotelState>(
        builder: (context, state) {
          if (state is HotelLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HotelLoaded) {
            final pendingHotels =
                state.hotels
                    .where(
                      (hotel) =>
                          hotel.verificationStatus.toLowerCase() != 'pending',
                    )
                    .toList();

            if (pendingHotels.isEmpty) {
              return const Center(child: Text('No pending hotels found'));
            }

            return Column(
              children: [
                ListViewHeadings(),
                const Divider(height: 0),
                Expanded(
                  child: ListView.builder(
                    itemCount: pendingHotels.length,
                    itemBuilder: (context, index) {
                      final hotel = pendingHotels[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => HotelDetailsScreen(
                                    hotelId: hotel.profileId,
                                  ),
                            ),
                          );
                        },
                        child: HotelLiseTile(hotel: hotel),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is HotelError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('No Data'));
          }
        },
      ),
    );
  }
}


