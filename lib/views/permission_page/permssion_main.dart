import 'package:flutter/material.dart';
import 'package:nest_admin_app/views/permission_page/hotel_list.dart';

class PermissionMain extends StatelessWidget {
  const PermissionMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Expanded(child: HotelListScreen())]);
  }
}
