import 'package:flutter/material.dart';
import 'package:nest_admin_app/constants/colors.dart';

class DashboardQuickStats extends StatelessWidget {
  const DashboardQuickStats({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount;

        if (constraints.maxWidth >= 1200) {
          crossAxisCount = 4;
        } else if (constraints.maxWidth >= 900) {
          crossAxisCount = 3;
        } else if (constraints.maxWidth >= 600) {
          crossAxisCount = 2;
        } else {
          crossAxisCount = 1;
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: crossAxisCount,
            shrinkWrap: true,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: crossAxisCount ==1?2.5:2,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              StatCard(
                title: 'Total Hotels',
                value: '3',
                icon: Icons.hotel,
                color: Colors.blue,
              ),
              StatCard(
                title: 'Active Bookings',
                value: '15',
                icon: Icons.book_online,
                color: Colors.green,
              ),
              StatCard(
                title: 'Total Revenue',
                value: '₹2413',
                icon: Icons.attach_money,
                color: Colors.orange,
              ),
              StatCard(
                title: 'Active Users',
                value: '4',
                icon: Icons.people,
                color: Colors.purple,
              ),
            ],
          ),
        );
      },
    );
  }
}


class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withAlpha((0.1*255).toInt()),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: AppColors.grey600,
               overflow: TextOverflow.ellipsis,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
