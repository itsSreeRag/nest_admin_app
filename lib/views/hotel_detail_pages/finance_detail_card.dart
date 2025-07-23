import 'package:flutter/material.dart';
import 'package:nest_admin_app/models/hotel_model.dart';
import 'package:nest_admin_app/views/hotel_detail_pages/permission_cards.dart';

class FinanceDetailsCard extends StatelessWidget {
  final HotelModel hotelData;
  const FinanceDetailsCard({super.key, required this.hotelData});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      title: 'Finance Details',
      content: LayoutBuilder(
        builder: (context, constraints) {
          final isWideForm = constraints.maxWidth > 600;

          if (isWideForm) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // First row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // GST Number
                    Expanded(
                      child: _buildFinanceField(
                        'GST Number',
                        hotelData.gstNumber,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // PAN Number
                    Expanded(
                      child: _buildFinanceField(
                        'PAN Number',
                        hotelData.panNumber,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Property Type
                _buildFinanceField('Property Number', hotelData.propertyNumber),
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // GST Number
                _buildFinanceField('GST Number', hotelData.gstNumber),
                const SizedBox(height: 20),
                // PAN Number
                Expanded(
                  child: _buildFinanceField('PAN Number', hotelData.panNumber),
                ),
                const SizedBox(height: 20),
                // Property Type
                _buildFinanceField('PAN Number', hotelData.panNumber),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildFinanceField(String label, String value) {
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(value, overflow: TextOverflow.ellipsis)),
              
            ],
          ),
        ),
      ],
    );
  }
}
