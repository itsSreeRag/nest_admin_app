import 'package:flutter/material.dart';
import 'package:nest_admin_app/models/hotel_model.dart';
import 'package:nest_admin_app/views/hotel_detail_pages/permission_cards.dart';

class GeneralInfoCard extends StatelessWidget {
  final HotelModel hotelData;
  const GeneralInfoCard({super.key, required this.hotelData});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      title: 'General Information',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hotel Name', style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 8),
                    Text(
                      hotelData.stayName,
                      style: TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),


          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hotel Id', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 8),
                  Text(
                    hotelData.uid,
                    style: TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
