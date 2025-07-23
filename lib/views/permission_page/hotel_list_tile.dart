import 'package:flutter/material.dart';
import 'package:nest_admin_app/constants/colors.dart';
import 'package:nest_admin_app/models/hotel_model.dart';

class HotelLiseTile extends StatelessWidget {
  final HotelModel hotel;
  const HotelLiseTile({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          color: AppColors.background,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(hotel.profileImage.toString()),
                ),
                const SizedBox(width: 10),
                // Hotel Name
                Expanded(
                  flex: 2,
                  child: Text(
                    hotel.stayName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                // Service Booked
                Expanded(
                  flex: 2,
                  child: Text(
                    hotel.city,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                // Price
                Expanded(
                  flex: 1,
                  child: Text(
                    hotel.contactNumber,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                VerificationCard(verificationStatus: hotel.verificationStatus),

                SizedBox(width: 10),
                // Date
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    child: Center(
                      child: Text(
                        hotel.accommodationType,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ),
                ),

                // Actions
              ],
            ),
          ),
        );
      },
    );
  }
}


class VerificationCard extends StatelessWidget {
  const VerificationCard({super.key, required this.verificationStatus});

  final String verificationStatus;

  Color getStatusColor() {
    switch (verificationStatus.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'block':
        return Colors.red;
      case 'approve':
        return Colors.green;
      default:
        return Colors.grey; 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: getStatusColor().withAlpha(200),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          verificationStatus,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

