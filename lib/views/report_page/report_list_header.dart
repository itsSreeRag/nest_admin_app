import 'package:flutter/material.dart';

class ReportListHeader extends StatelessWidget {
  const ReportListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      child: Row(
        children: const [
          SizedBox(width: 40),
          Expanded(
            flex: 2,
            child: Text(
              'User Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Title',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 100,
            child: Center(
              child: Text(
                'Status',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Date',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
