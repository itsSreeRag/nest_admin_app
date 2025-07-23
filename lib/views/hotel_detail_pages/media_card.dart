import 'package:flutter/material.dart';
import 'package:nest_admin_app/models/registration_model.dart';
import 'package:nest_admin_app/views/hotel_detail_pages/permission_cards.dart';

class MediaCard extends StatelessWidget {
  final RegistrationModel hotelData;
  const MediaCard({super.key, required this.hotelData});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      title: 'Media',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text('Photo', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, constraints) {
              final imageWidth =
                  constraints.maxWidth < 650
                      ? (constraints.maxWidth - 24) / 2
                      : 150.0;

              return SizedBox(
                height: imageWidth * 0.53,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hotelData.images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          hotelData.images[index],
                          width: imageWidth,
                          height: imageWidth * 0.53,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
