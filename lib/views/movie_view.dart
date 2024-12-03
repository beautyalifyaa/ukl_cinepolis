import 'package:flutter/material.dart';
import 'package:flutter_application_5/widgets/bottom_nav.dart';
import 'package:flutter_application_5/views/cinema_view.dart'; // Pastikan path CinemaView sudah benar

class MovieView extends StatelessWidget {
  final List<Map<String, String>> _movies = [
    {
      'title': 'BILA ESOK IBU TIADA (13+)',
      'image': 'ibutiada.jpeg',
    },
    {
      'title': 'WICKED (SU)',
      'image': 'wicked.jpeg',
    },
    {
      'title': 'GLADIATOR',
      'image': 'gladiator.jpeg',
    },
    {
      'title': 'KONCO-KONCO EDAN',
      'image': 'konco_edan.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E1D54),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: DropdownButton<String>(
          value: "Malang",
          items: <String>['Malang', 'Surabaya', 'Jakarta', 'Bandung']
              .map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: TextStyle(color: Colors.white)),
            );
          }).toList(),
          onChanged: (String? newValue) {},
          dropdownColor: const Color(0xFF0E1D54),
          underline: Container(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Movie / Cinema",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('Tab Movie clicked');
                    },
                    child: Column(
                      children: [
                        Text(
                          "Movie",
                          style: TextStyle(
                            color: const Color(0xFF0E1D54),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          height: 2,
                          width: 50,
                          color: const Color(0xFF0E1D54),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Menavigasi ke CinemaView saat tab Cinema diklik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CinemaView(), // Pastikan CinemaView sudah benar
                        ),
                      );
                    },
                    child: Text(
                      "Cinema",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 0.3,
              ),
              itemCount: _movies.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        _movies[index]['image']!,
                        fit: BoxFit.cover,
                        height: 350,
                        width: double.infinity,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      _movies[index]['title']!,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          print("Buy Now for ${_movies[index]['title']} clicked");
                        },
                        child: Text("Buy Now"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(page: 2), // Navigasi untuk BottomNav
    );
  }
}
