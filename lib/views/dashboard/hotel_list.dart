import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nest_admin_app/controllers/hotels_bloc/hotel_bloc.dart';
import 'package:nest_admin_app/controllers/hotels_bloc/hotel_state.dart';
import 'package:nest_admin_app/views/dashboard/widgets/my_list_tile.dart';
import 'package:nest_admin_app/views/dashboard/widgets/mobile_filters.dart';
import 'package:nest_admin_app/views/dashboard/widgets/desktop_filters.dart';
import 'package:nest_admin_app/views/dashboard/widgets/teble_header.dart';
import 'package:nest_admin_app/views/hotel_detail_pages/permission_details_screen_main.dart';

class HotelsList extends StatelessWidget {
  const HotelsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        return LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile = constraints.maxWidth < 600;
    
            if (state is HotelLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HotelLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Heading
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Recent Hotels List',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (!isMobile)
                              TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.file_download_outlined,
                                ),
                                label: const Text('Export'),
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.blue,
                                ),
                              ),
                          ],
                        ),
                      ),
    
                      // Filters
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child:
                            isMobile
                                ? const MobileFilters()
                                : const DesktopFilters(),
                      ),
    
                      const SizedBox(height: 16),
    
                      // Table Header
                      TableHeader(isMobile: isMobile),
    
                      // Hotel List
                      ListView.builder(
                        itemCount: state.hotels.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final hotel = state.hotels[index];
                          return InkWell(
                            onTap: () {
                              log('message');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HotelDetailsScreen(index: index,),
                                ),
                              );
                            },
                            child: MyListTile(
                              name: hotel.stayName,
                              id: hotel.uid,
                              category: hotel.accommodationType,
                              rating: hotel.email,
                              location: hotel.state,
                              status: hotel.verificationStatus.toString(),
                              statusColor:
                                  'green', 
                              isMobile: isMobile,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is HotelError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('No Data'));
            }
          },
        );
      },
    );
  }
}
