import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  final int page;

  BottomNav({Key? key, required this.page}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  void getPage(int index) {
    if (widget.page == index) return; // Menghindari navigasi ulang jika index tidak berubah

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/dashboard');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/mybooking');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/movie');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/cinema');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Membatasi currentIndex dalam rentang 0 hingga 3 agar selalu valid
    int currentIndex = widget.page.clamp(0, 3);

    return BottomNavigationBar(
      selectedItemColor:const Color(0xFF0E1D54),
      unselectedItemColor: Colors.grey,
      currentIndex: currentIndex,
      onTap: getPage,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.confirmation_number), label: "My Booking"),
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movie"),
        BottomNavigationBarItem(icon: Icon(Icons.local_movies), label: "Cinema"),
      ],
    );
  }
}
