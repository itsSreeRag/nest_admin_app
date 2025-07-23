import 'package:flutter/material.dart';
import 'package:nest_admin_app/constants/colors.dart';
import 'package:nest_admin_app/views/dashboard/status_info_card/status_info_card.dart';

class StatusInfoCardList extends StatelessWidget {
  const StatusInfoCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overviews',
          style: TextStyle(
            color: AppColors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            StatusInfoCard(
              title: 'Total Hotels',
              value: '48',
              icon: Icons.business,
              color: Colors.teal,
            ),
            StatusInfoCard(
              title: 'Active Bookings',
              value: '237',
              icon: Icons.book_online,
              color: Colors.orange,
            ),
            StatusInfoCard(
              title: 'Available Rooms',
              value: '152',
              icon: Icons.meeting_room,
              color: Colors.blue,
            ),
            StatusInfoCard(
              title: 'Revenue',
              value: '\$36,450',
              icon: Icons.attach_money,
              color: Colors.green,
            ),
          ],
        ),
      ],
    );
  }
}
