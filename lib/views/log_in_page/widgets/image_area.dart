import 'package:flutter/material.dart';
import 'package:nest_admin_app/constants/colors.dart';

class ImageArea extends StatelessWidget {
  const ImageArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/hoteal.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.black.withAlpha((0.4 * 255).toInt()),
                AppColors.black.withAlpha((0.7 * 255).toInt()),
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Manage Your Hotels with Ease',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: AppColors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  '“Stay organized, stay ahead”',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.white,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
