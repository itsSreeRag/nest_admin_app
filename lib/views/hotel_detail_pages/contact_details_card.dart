import 'package:flutter/material.dart';
import 'package:nest_admin_app/models/registration_model.dart';
import 'package:nest_admin_app/views/hotel_detail_pages/permission_cards.dart';

class ContactDetailsCard extends StatelessWidget {
  final RegistrationModel hotelData;
  const ContactDetailsCard({super.key, required this.hotelData});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      title: 'Contact Details',
      content: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate how many fields we can fit per row
          final fieldWidth = 200.0; // Desired field width
          final spacing = 16.0;
          final availableWidth = constraints.maxWidth;
          int fieldsPerRow = (availableWidth / (fieldWidth + spacing)).floor();
          fieldsPerRow = fieldsPerRow < 1 ? 1 : fieldsPerRow;

          final fields = [
            _buildContactField('Phone number', hotelData.contactNumber),
            _buildContactField('Email', hotelData.email),
            _buildContactField('Booking Since', hotelData.selectedYear!),
          ];

          if (fieldsPerRow == 1) {
            // Stack fields vertically
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...fields.map(
                  (field) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: field,
                  ),
                ),
              ],
            );
          } else {
            // Create rows with fields
            return Wrap(
              spacing: spacing,
              runSpacing: spacing,
              alignment: WrapAlignment.start,
              children:
                  fields
                      .map((field) => SizedBox(width: fieldWidth, child: field))
                      .toList(),
            );
          }
        },
      ),
    );
  }

  Widget _buildContactField(String label, String value) {
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
