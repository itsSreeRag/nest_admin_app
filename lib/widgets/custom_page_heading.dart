import 'package:flutter/material.dart';
import 'package:nest_admin_app/constants/colors.dart';

class CustomPageHeding extends StatelessWidget {
 final String title;
 final String subTitle;
 final IconData icon;
  const CustomPageHeding({super.key, required this.title, required this.subTitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withAlpha((0.1 * 255).toInt()),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withAlpha(100),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                 icon,
                  color: AppColors.primary,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     title,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subTitle,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.grey300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}