import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nest_admin_app/controllers/auth_bloc/auth_bloc.dart';
import 'package:nest_admin_app/views/log_in_page/log_in_page_main.dart';
import 'package:nest_admin_app/views/permission_page/permssion_main.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 4,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.teal[700],
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.hotel, color: Colors.teal[700]),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Nest Admin',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _drawerItem(Icons.business, 'Dashboard'),
                _drawerItem(Icons.business, 'Hotels'),
                // _drawerItem(Icons.admin_panel_settings, 'Permissions'),
                _drawerItem(Icons.summarize, 'Reports'),
                _drawerItem(Icons.star_rate, 'Reviews'),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.admin_panel_settings, color: Colors.teal[700]),
            title: Text(
              'Permissions',
              style: TextStyle(color: Colors.grey[800]),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PermissionMain()),
              );
            },
          ),
          // _drawerItem(Icons.logout, 'Logout'),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthInitial) {
                // Navigate to login screen after logout
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPageMain()),
                );
              }
            },

            child: ListTile(
              leading: Icon(Icons.logout, color: Colors.teal[700]),
              title: Text('Logout', style: TextStyle(color: Colors.grey[800])),
              onTap: () => _showLogoutDialog(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal[700]),
      title: Text(title, style: TextStyle(color: Colors.grey[800])),
      onTap: () {},
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text("Logout"),
            content: const Text("Are you sure you want to log out?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(); // Close dialog
                  context.read<AuthBloc>().add(
                    LogoutRequested(),
                  ); // Dispatch event
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
    );
  }
}
