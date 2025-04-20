import 'package:flutter/material.dart';
import 'package:nest_admin_app/views/dashboard/widgets/custome_filter_clip.dart';
import 'custom_icon_button.dart';

class MobileFilters extends StatelessWidget {
  const MobileFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          children: [
            CustomFilterChip(
              label: 'All Hotels',
              isSelected: true,
              onTap: () {},
            ),
            CustomFilterChip(
              label: 'Available',
              isSelected: false,
              onTap: () {},
            ),
            CustomFilterChip(label: 'Service', isSelected: false, onTap: () {}),
            CustomFilterChip(
              label: 'Unavailable',
              isSelected: false,
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            CustomIconButton(icon: Icons.calendar_today, label: 'Select Date'),
            CustomIconButton(icon: Icons.filter_list, label: 'Filters'),
          ],
        ),
      ],
    );
  }
}
