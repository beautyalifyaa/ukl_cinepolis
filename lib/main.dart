import 'package:flutter/material.dart';
import 'package:flutter_application_5/views/splash_view.dart';
import 'package:flutter_application_5/views/login_view.dart';
import 'package:flutter_application_5/views/dashboard_view.dart';
import 'package:flutter_application_5/views/myBooking_view.dart';
import 'package:flutter_application_5/views/movie_view.dart';
import 'package:flutter_application_5/views/cinema_view.dart';

void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cinepolis",
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 5, 29, 48), // Warna utama aplikasi
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashView(),
        '/login': (context) => LoginView(),
        '/dashboard': (context) => DashboardView(),
        '/mybooking': (context) => MyBookingView(),
        '/movie': (context) => MovieView(),
        '/cinema': (context) => CinemaView(),
      },
    );
  }
}
