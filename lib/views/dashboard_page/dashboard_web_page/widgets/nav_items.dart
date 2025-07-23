import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final String title;
  final bool isActive;

  const NavItem({
    super.key,
    required this.title,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextButton(
        onPressed: () {},
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: isActive ? Colors.blue : Colors.black87,
          ),
        ),
      ),
    );
  }
}