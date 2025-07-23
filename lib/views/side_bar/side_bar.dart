import 'package:flutter/material.dart';
import 'package:nest_admin_app/constants/colors.dart';
import 'package:sidebarx/sidebarx.dart';

class MySideBar extends StatelessWidget {
  const MySideBar({super.key, required this.controller});

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: AppColors.primary.withAlpha(150),
        textStyle: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w500,
        ),
        selectedTextStyle: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w500,
        ),
        hoverTextStyle: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w500,
        ),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: AppColors.primary),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withAlpha((0.37 * 255).toInt()),
          ),
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.primary],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withAlpha((0.28 * 255).toInt()),
              blurRadius: 30,
            ),
          ],
        ),
        iconTheme: IconThemeData(color: AppColors.primary, size: 20),
        selectedIconTheme: const IconThemeData(
          color: AppColors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(color: AppColors.white),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return Container(
          decoration: BoxDecoration(color: AppColors.primary),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.bed_outlined, color: AppColors.white),
              if (extended) SizedBox(width: 5),
              if (extended)
                Text('Nest', style: TextStyle(color: AppColors.white)),
            ],
          ),
        );
      },
      items: [
        const SidebarXItem(icon: Icons.dashboard_outlined, label: 'Dashboard'),
        const SidebarXItem(icon: Icons.apartment_outlined, label: 'Hotel List'),
        const SidebarXItem(
          icon: Icons.lock_person_outlined,
          label: 'Permissions',
        ),
        const SidebarXItem(icon: Icons.bar_chart_outlined, label: 'Reports'),
      ],
    );
  }
}
