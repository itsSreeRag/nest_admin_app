import 'package:flutter/material.dart';
import 'package:nest_admin_app/models/registration_model.dart';
import 'package:nest_admin_app/views/hotel_detail_pages/facility_clip.dart';
import 'package:nest_admin_app/views/hotel_detail_pages/permission_cards.dart';

class Facilitycard extends StatelessWidget {
  final RegistrationModel hotelData;
  const Facilitycard({super.key, required this.hotelData});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      title: 'Facilities',
      content: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          FacilityChip(
            title: hotelData.propertyType,
            value: (hotelData.propertyType == 'Owned'),
          ),

          FacilityChip(title: 'Registered', value: false),
          FacilityChip(
            title: 'Free Cancellation',
            value: hotelData.freeCancellation,
          ),
          FacilityChip(
            title: 'Couple Friendly',
            value: hotelData.coupleFriendly,
          ),
          FacilityChip(title: 'Parking Available', value: hotelData.parking),
          FacilityChip(
            title: 'Restaurant',
            value: hotelData.restaurantInsideProperty,
          ),
        ],
      ),
    );
  }
}
