import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nest_admin_app/constants/colors.dart';
import 'package:nest_admin_app/controllers/auth_bloc/auth_bloc.dart';
import 'package:nest_admin_app/controllers/report_bloc/report_bloc.dart';
import 'package:nest_admin_app/controllers/report_bloc/report_event.dart';
import 'package:nest_admin_app/controllers/verification_status_bloc/verification_status_bloc.dart';
import 'package:nest_admin_app/controllers/hotels_bloc/hotel_bloc.dart';
import 'package:nest_admin_app/services/hotel_repository.dart';
import 'package:nest_admin_app/controllers/hotels_bloc/hotel_event.dart';
import 'package:nest_admin_app/firebase_options.dart';
import 'package:nest_admin_app/services/report_service.dart';
import 'package:nest_admin_app/views/side_bar/side_bar_main.dart';

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
                  HotelBloc(HotelFirebaseServices())..add(FetchHotels()),
        ),
        BlocProvider<VerificationStatusBloc>(
          create: (context) => VerificationStatusBloc(HotelFirebaseServices()),
        ),
        BlocProvider<ReportBloc>(
          create:
              (_) => ReportBloc(ReportServices())..add(FetchReportsByUserId()),
        ),
      ],
      child: MaterialApp(
        title: 'SidebarX Example',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primary,
          scaffoldBackgroundColor: AppColors.white,
          textTheme: const TextTheme(
            headlineSmall: TextStyle(
              color: Colors.white,
              fontSize: 46,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        home: SideBarMain(),
      ),
    );
  }
}
