import 'package:flutter/material.dart';

class TableHeader extends StatelessWidget {
  final bool isMobile;

  const TableHeader({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      color: Colors.grey.shade100,
      child: Row(
        children: [
          const Expanded(
            flex: 2,
            child: Text(
              'Hotels',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          if (!isMobile)
            const Expanded(
              child: Text(
                'Hotel ID',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          const Expanded(
            child: Text(
              'Category',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          const Expanded(
            child: Text(
              'Rating',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          if (!isMobile)
            const Expanded(
              child: Text(
                'Location',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          const Expanded(
            child: Text(
              'Status',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
