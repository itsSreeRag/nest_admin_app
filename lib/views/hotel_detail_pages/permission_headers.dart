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
                  // Row(
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: [
                  //     OutlinedButton(
                  //       onPressed: () {},
                  //       style: OutlinedButton.styleFrom(
                  //         foregroundColor: Colors.red,
                  //         side: const BorderSide(color: Colors.red),
                  //         padding: const EdgeInsets.symmetric(horizontal: 20),
                  //       ),
                  //       child: const Text('Reject'),
                  //     ),
                  //     const SizedBox(width: 12),
                  //     ElevatedButton(
                  //       onPressed: () {},
                  //       style: ElevatedButton.styleFrom(
                  //         backgroundColor: Colors.blue,
                  //         padding: const EdgeInsets.symmetric(horizontal: 20),
                  //       ),
                  //       child: const Text('Approve'),
                  //     ),
                  //   ],
                  // ),
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
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: OutlinedButton(
                  //         onPressed: () {},
                  //         style: OutlinedButton.styleFrom(
                  //           foregroundColor: Colors.red,
                  //           side: const BorderSide(color: Colors.red),
                  //         ),
                  //         child: const Text('Reject'),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 12),
                  //     Expanded(
                  //       child: ElevatedButton(
                  //         onPressed: () {},
                  //         style: ElevatedButton.styleFrom(
                  //           backgroundColor: Colors.blue,
                  //         ),
                  //         child: const Text('Approve'),
                  //       ),
                  //     ),
                  //   ],
                  // ),
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
