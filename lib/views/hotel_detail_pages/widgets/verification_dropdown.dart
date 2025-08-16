import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nest_admin_app/controllers/hotels_bloc/hotel_bloc.dart';
import 'package:nest_admin_app/controllers/hotels_bloc/hotel_event.dart';
import 'package:nest_admin_app/controllers/verification_status_bloc/verification_status_bloc.dart';
import 'package:nest_admin_app/controllers/verification_status_bloc/verification_status_event.dart';

class VerificationDropDown extends StatelessWidget {
  final String verificationSatus;
  final String hotelUid;

  const VerificationDropDown({
    super.key,
    required this.verificationSatus,
    required this.hotelUid,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        context.read<VerificationStatusBloc>().add(
          UpdateVerificationStatus(hotelUid: hotelUid, newStatus: value),
        );
        context.read<HotelBloc>().add(
          FetchHotels(),
        );
      },
      itemBuilder:
          (context) => const [
            PopupMenuItem(value: 'Block', child: Text('Block')),
            PopupMenuItem(value: 'Pending', child: Text('Pending')),
            PopupMenuItem(value: 'Approve', child: Text('Approve')),
          ],
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.orange[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              verificationSatus,
              style: TextStyle(
                color: Colors.orange[800],
                fontWeight: FontWeight.w500,
              ),
            ),
            const Icon(
              Icons.arrow_drop_down, color: Colors.orange),
          ],
        ),
      ),
    );
  }
}