import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nest_admin_app/controllers/auth/auth_bloc.dart';
import 'package:nest_admin_app/controllers/bloc/verification_status_bloc.dart';
import 'package:nest_admin_app/controllers/hotels/hotel_bloc.dart';
import 'package:nest_admin_app/controllers/hotel_repository.dart';
import 'package:nest_admin_app/controllers/hotels/hotel_event.dart';
import 'package:nest_admin_app/firebase_options.dart';
import 'package:nest_admin_app/views/dashboard/dashboard_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<HotelBloc>(
          create:
              (context) =>
                  HotelBloc(HotelRepository())..add(SubscribeToHotels()),
        ),
        BlocProvider<VerificationStatusBloc>(
          create: (context) => VerificationStatusBloc(HotelRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HotelAdminDashboard(),
      ),
    );
  }
}
