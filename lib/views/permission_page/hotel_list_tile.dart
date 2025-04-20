import 'package:flutter/material.dart';
import 'package:nest_admin_app/models/registration_model.dart';
import 'package:nest_admin_app/views/dashboard/widgets/verification_drop_down.dart';

class HotelLiseTile extends StatelessWidget {
  final RegistrationModel hotel;
  const HotelLiseTile({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: Image.network(hotel.profileImage!.toString()),
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
                // Status
                // Status with Dropdown
                VerificationDropDown(
                  verificationSatus: hotel.verificationSatus!,
                  hotelUid: hotel.uid,
                ),

                SizedBox(width: 10),
                // Date
                Expanded(
                  flex: 1,
                  child: Text(
                    hotel.accommodationType,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                // Actions
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_red_eye, size: 20),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, size: 20),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
