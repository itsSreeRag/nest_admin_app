import 'package:flutter/material.dart';
import 'package:nest_admin_app/constants/colors.dart';
import 'package:nest_admin_app/models/hotel_model.dart';

class HotelCard1 extends StatelessWidget {
  final HotelModel hotel;

  const HotelCard1({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(4),
              ),
              image: DecorationImage(
                image: NetworkImage(hotel.images[0]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotel.stayName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${hotel.city},${hotel.country}',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.hotel, color: Colors.green, size: 16),
                    Text(' ${hotel.propertyType}'),
                    const Spacer(),
                    Text(
                      '₹${hotel.basePrice}/night',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}