import 'package:flutter/material.dart';
import 'package:nest_admin_app/views/dashboard/widgets/custome_filter_clip.dart';
import 'custom_icon_button.dart'; // Make sure this file contains CustomIconButton

class DesktopFilters extends StatelessWidget {
  const DesktopFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomFilterChip(
              label: 'All Hotels',
              isSelected: true,
              onTap: () {},
            ),
            const SizedBox(width: 8),
            CustomFilterChip(
              label: 'Available',
              isSelected: false,
              onTap: () {},
            ),
            const SizedBox(width: 8),
            CustomFilterChip(label: 'Service', isSelected: false, onTap: () {}),
            const SizedBox(width: 8),
            CustomFilterChip(
              label: 'Unavailable',
              isSelected: false,
              onTap: () {},
            ),
          ],
        ),
        Row(
          children: [
            CustomIconButton(icon: Icons.calendar_today, label: 'Select Date'),
            const SizedBox(width: 8),
            CustomIconButton(icon: Icons.filter_list, label: 'Filters'),
          ],
        ),
      ],
    );
  }
}
