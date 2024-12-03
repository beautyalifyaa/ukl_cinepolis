import 'package:flutter/material.dart';
import 'package:flutter_application_5/widgets/bottom_nav.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int selectedNowShowingIndex = -1; // Indeks gambar terpilih untuk Now Showing
  int selectedUpcomingIndex = -1; // Indeks gambar terpilih untuk Upcoming

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E1D54),
        foregroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButton<String>(
              value: 'Malang',
              items: <String>['Malang', 'Jakarta', 'Surabaya'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: const TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: (_) {},
              dropdownColor: const Color(0xFF0E1D54),
              underline: Container(),
              icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
            ),
            Row(
              children: [
                const Icon(Icons.favorite_border, color: Colors.white),
                const SizedBox(width: 15),
                const Icon(Icons.notifications_outlined, color: Colors.white),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () {
                    print("Profile icon tapped!");
                  },
                  child: const Icon(Icons.person_outline, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Section
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "Hello, Guest",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                "Kamu mau nonton apa hari ini?",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 20),

              // Banner Section
              Container(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    bannerCard('petak_umpet.jpeg'),
                    bannerCard('ibu_tiada.jpeg'),
                    bannerCard('kutukan_setan.jpg'),
                    bannerCard('gampang_cuan.jpg'),
                    bannerCard('moana.jpg'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Now Showing Section
              sectionTitle("Now Showing", () {}),
              const SizedBox(height: 10),
              movieList(
                [
                  'petakumpet.jpeg',
                  'ibutiada.jpeg',
                  'jatuh_cinta.jpeg',
                  'kumenangis.jpg',
                  'agak_laen.jpeg',
                  'moana2.jpeg',
                  'inside_out.jpeg',
                  'carls_date.jpg',
                  'luca.jpg'
                ],
                selectedNowShowingIndex,
                (index) {
                  setState(() {
                    selectedNowShowingIndex = selectedNowShowingIndex == index ? -1 : index;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Upcoming Section
              sectionTitle("Upcoming", () {}),
              const SizedBox(height: 10),
              movieList(
                [
                  'miracle.jpg',
                  'bad_genius.jpg',
                  'drakor.jpg',
                  'gangnam_zombie.jpg',
                  'hutang_nyawa.jpg',
                  'konco_edan.jpg',
                  'moana2(3d).jpg',
                  'modal_nekad.jpg',
                  'nct_dream.jpg',
                  'runt.jpg'
                ],
                selectedUpcomingIndex,
                (index) {
                  setState(() {
                    selectedUpcomingIndex = selectedUpcomingIndex == index ? -1 : index;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Promo Banner Section
              sectionTitle("Promotion", () {}),
              const SizedBox(height: 10),
              promoBannerList([
                'banner1.jpg',
                'banner3.jpg',
              ]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(page: 0,)
    );
  }

  // Widget untuk judul bagian
  Widget sectionTitle(String title, VoidCallback onSeeAllPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onSeeAllPressed,
          child: const Text(
            "See All",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }

  // Widget untuk daftar film dengan efek interaktif
  Widget movieList(List<String> imagePaths, int selectedIndex, Function(int) onTap) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onTap(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              width: isSelected ? 150 : 100,
              height: isSelected ? 180 : 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imagePaths[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Widget untuk kartu banner
  Widget bannerCard(String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          imagePath,
          width: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Widget untuk daftar promo banner
  Widget promoBannerList(List<String> imagePaths) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return promoCard(imagePaths[index]);
        },
      ),
    );
  }

  // Widget untuk kartu promo
  Widget promoCard(String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          imagePath,
          width: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
