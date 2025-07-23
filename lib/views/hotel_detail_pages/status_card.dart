import 'package:flutter/material.dart';
import 'package:nest_admin_app/models/registration_model.dart';
import 'package:nest_admin_app/views/hotel_detail_pages/permission_cards.dart';

class StatusCard extends StatelessWidget {
  final RegistrationModel hotelData;
  const StatusCard({super.key, required this.hotelData});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      title: 'Status',
      content: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          hotelData.verificationStatus!,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
