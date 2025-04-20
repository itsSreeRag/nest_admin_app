import 'package:flutter/material.dart';
import 'package:nest_admin_app/views/dashboard/widgets/verification_drop_down.dart';

class MyListTile extends StatelessWidget {
  final String name;
  final String id;
  final String category;
  final String rating;
  final String location;
  final String status;
  final String statusColor;
  final bool isMobile;

  const MyListTile({
    super.key,
    required this.name,
    required this.id,
    required this.category,
    required this.rating,
    required this.location,
    required this.status,
    required this.statusColor,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          if (!isMobile)
            Expanded(
              child: Text(id, style: const TextStyle(color: Colors.blue)),
            ),
          Expanded(child: Text(category)),
          Expanded(child: Text(rating)),
          if (!isMobile) Expanded(child: Text(location)),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color:
                    statusColor == 'green'
                        ? Colors.green.shade100
                        : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16),
              ),
              child: VerificationDropDown(
                verificationSatus: status,
                hotelUid: id,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
