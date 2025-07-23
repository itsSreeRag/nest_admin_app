import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nest_admin_app/constants/colors.dart';
import 'package:nest_admin_app/controllers/hotels_bloc/hotel_bloc.dart';
import 'package:nest_admin_app/controllers/hotels_bloc/hotel_state.dart';
import 'package:nest_admin_app/models/hotel_model.dart';
import 'package:nest_admin_app/widgets/hotel_card1.dart';

class DashWebHotelManagement extends StatelessWidget {
  const DashWebHotelManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hotel Management',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            BlocBuilder<HotelBloc, HotelState>(
              builder: (context, state) {
                if (state is HotelLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is HotelLoaded) {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      int crossAxisCount;

                      if (constraints.maxWidth >= 1200) {
                        crossAxisCount = 4;
                      } else if (constraints.maxWidth >= 900) {
                        crossAxisCount = 3;
                      } else if (constraints.maxWidth >= 600) {
                        crossAxisCount = 2;
                      } else {
                        crossAxisCount = 1;
                      }
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: crossAxisCount == 1 ? 1.5 : 1.2,
                        ),
                        itemCount: state.hotels.length,
                        itemBuilder: (context, index) {
                          HotelModel hotel = state.hotels[index];
                          return HotelCard1(hotel: hotel);
                        },
                      );
                    },
                  );
                } else if (state is HotelError) {
                  return Center(child: Text(state.message));
                } else {
                  return Center(child: Text('No Data'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
