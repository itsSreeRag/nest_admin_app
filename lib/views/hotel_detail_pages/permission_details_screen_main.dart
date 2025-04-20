import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nest_admin_app/constants/colors.dart';
import 'package:nest_admin_app/controllers/hotels/hotel_bloc.dart';
import 'package:nest_admin_app/controllers/hotels/hotel_state.dart';
import 'package:nest_admin_app/models/registration_model.dart';
import 'package:nest_admin_app/views/hotel_detail_pages/category_card.dart';
import 'package:nest_admin_app/views/hotel_detail_pages/contact_details_card.dart';
import 'package:nest_admin_app/views/hotel_detail_pages/facilitycard.dart';
import 'package:nest_admin_app/views/hotel_detail_pages/finance_detail_card.dart';
import 'package:nest_admin_app/views/hotel_detail_pages/general_info_card.dart';
import 'package:nest_admin_app/views/hotel_detail_pages/media_card.dart';
import 'package:nest_admin_app/views/hotel_detail_pages/permission_headers.dart';
import 'package:nest_admin_app/views/hotel_detail_pages/status_card.dart';

class HotelDetailsScreen extends StatelessWidget {
  final int index;
  const HotelDetailsScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isWideScreen = constraints.maxWidth > 900;
                    final isMediumScreen = constraints.maxWidth > 600;
                    if (state is HotelLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is HotelLoaded) {
                      final hotel = state.hotels[index];
                      return SingleChildScrollView(
                        padding: EdgeInsets.all(isWideScreen ? 20.0 : 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Page title and tabs
                            PageHeader(
                              hotelName: hotel.stayName,
                              status: hotel.verificationSatus.toString(),
                              uid: hotel.uid,
                            ),

                            const SizedBox(height: 20),

                            // Content area with layout changes based on screen width
                            isWideScreen
                                ? _buildWideLayout(hotel)
                                : _buildNarrowLayout(isMediumScreen, hotel),
                          ],
                        ),
                      );
                    } else if (state is HotelError) {
                      return Center(child: Text(state.message));
                    } else {
                      return const Center(child: Text('No Data'));
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildWideLayout(RegistrationModel hotelData) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left column - 70% width
        Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GeneralInfoCard(hotelData: hotelData),
              SizedBox(height: 20),
              MediaCard(hotelData: hotelData),
              SizedBox(height: 20),
              FinanceDetailsCard(hotelData: hotelData),
              SizedBox(height: 20),
              ContactDetailsCard(hotelData: hotelData),
            ],
          ),
        ),

        const SizedBox(width: 20),

        // Right column - 30% width
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CategoryCard(hotelData: hotelData),
              SizedBox(height: 20),
              Facilitycard(hotelData: hotelData),
              SizedBox(height: 20),
              StatusCard(hotelData: hotelData),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(bool isMediumScreen, RegistrationModel hotelData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GeneralInfoCard(hotelData: hotelData),
        const SizedBox(height: 20),
        MediaCard(hotelData: hotelData),
        const SizedBox(height: 20),
        FinanceDetailsCard(hotelData: hotelData),
        const SizedBox(height: 20),
        ContactDetailsCard(hotelData: hotelData),
        const SizedBox(height: 20),
        // On medium screens, place category and status cards side by side
        isMediumScreen
            ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: CategoryCard(hotelData: hotelData)),
                SizedBox(width: 20),
                Expanded(child: StatusCard(hotelData: hotelData)),
              ],
            )
            : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CategoryCard(hotelData: hotelData),
                SizedBox(height: 20),
                StatusCard(hotelData: hotelData),
              ],
            ),
      ],
    );
  }
}
