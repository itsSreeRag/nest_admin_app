import 'package:flutter/material.dart';
import 'package:nest_admin_app/views/hotel_list_page/hotel_list.dart';
import 'package:nest_admin_app/widgets/custom_page_heading.dart';

class HotelListPageMain extends StatelessWidget {
  const HotelListPageMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header Section
        CustomPageHeding(
          icon: Icons.hotel,
          title: 'Hotel List',
          subTitle: 'View and manage hotel profiles',
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha((0.1 * 255).toInt()),
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: const HotelListScreen(),
            ),
          ),
        ),
      ],
    );
  }
}
