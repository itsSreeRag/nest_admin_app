import 'package:flutter/material.dart';
import 'package:nest_admin_app/views/hotel_detail_pages/permission_details_screen_main.dart';

class HotelIdBlock extends StatelessWidget {
  final String hotelId;
  const HotelIdBlock({super.key, required this.hotelId});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HotelDetailsScreen(hotelId: hotelId),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFE0F2FE),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF3B82F6), width: 1),
            ),
            child: Row(
              children: [
                Icon(Icons.business, color: Color(0xFF3B82F6), size: 16),
                SizedBox(width: 8),
                Text(
                  'HOTEL ID: $hotelId',
                  style: TextStyle(
                    color: Color(0xFF3B82F6),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.check, size: 18),
          label: const Text('Block'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3B82F6),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ],
    );
  }
}
