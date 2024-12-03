import 'dart:async';

import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // Timer untuk navigasi ke halaman login setelah 3 detik
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });

    return Scaffold(
      backgroundColor: const Color(0xFF0E1D54), 
      body: Center(
        child: Image.asset(
          'assets/logo_cinepolis.png', // Ganti dengan path logo aplikasi Anda
          width: 150,
          height: 150,
        ),
     ),
);
}
}