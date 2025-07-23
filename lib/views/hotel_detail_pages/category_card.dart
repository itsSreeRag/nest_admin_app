import 'package:flutter/material.dart';
import 'package:nest_admin_app/models/hotel_model.dart';
import 'package:nest_admin_app/views/hotel_detail_pages/permission_cards.dart';

class CategoryCard extends StatelessWidget {
  final HotelModel hotelData;
  const CategoryCard({super.key, required this.hotelData});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      title: 'Location',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LabelValueTile(label: 'City', value: hotelData.city),
          LabelValueTile(label: 'State', value: hotelData.state),
          LabelValueTile(label: 'country', value: hotelData.country),
          LabelValueTile(label: 'Pincode', value: hotelData.pincode),
        ],
      ),
    );
  }
}

class LabelValueTile extends StatelessWidget {
  final String label;
  final String value;

  const LabelValueTile({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(value, overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}
