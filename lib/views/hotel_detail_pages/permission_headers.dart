import 'package:flutter/material.dart';
import 'package:nest_admin_app/views/dashboard/widgets/verification_drop_down.dart';

class PageHeader extends StatelessWidget {
  final String hotelName;
  final String status;
  final String uid;
  const PageHeader({
    super.key,
    required this.hotelName,
    required this.status,
    required this.uid,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 500;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title and action buttons
            if (!isSmallScreen)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'Hotel Details',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  VerificationDropDown(
                    verificationSatus: status,
                    hotelUid: uid,
                  ),
                ],
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Hotel Details',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                ],
              ),

            const SizedBox(height: 20),

            // Tabs
            Text(
              hotelName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.blue,
              ),
            ),
          ],
        );
      },
    );
  }
}
