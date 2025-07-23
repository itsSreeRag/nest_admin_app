import 'package:flutter/material.dart';

class ListViewHeadings extends StatelessWidget {
  const ListViewHeadings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      child: Row(
        children: const [
          SizedBox(width: 40), // space for avatar
          Expanded(
            flex: 2,
            child: Text(
              'Hotel Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'City',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Contact',
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
                'Type',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}