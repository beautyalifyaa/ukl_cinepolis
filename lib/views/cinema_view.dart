import 'package:flutter/material.dart';
import 'package:flutter_application_5/widgets/bottom_nav.dart';

class CinemaView extends StatelessWidget {
  final List<Map<String, dynamic>> cinemas = [
    {
      'name': 'Malang Town Square',
      'distance': '8.03 km away',
      'types': ['REGULAR', 'LUXE'],
    },
    {
      'name': 'Lippo Plaza Batu',
      'distance': '11.23 km away',
      'types': ['REGULAR'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cinema List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0E1D54),
        foregroundColor: Colors.white,
        actions: [
          DropdownButton<String>(
            value: 'Malang',
            style: TextStyle(color: Colors.white),
            dropdownColor: const Color(0xFF0E1D54),
            underline: Container(),
            icon: Icon(Icons.arrow_drop_down, color: Colors.white),
            items: ['Malang', 'Jakarta', 'Surabaya']
                .map((city) => DropdownMenuItem<String>(
                      value: city,
                      child: Text(city),
                    ))
                .toList(),
            onChanged: (value) {
              print('Selected city: $value');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cinema / Movie',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Movie',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Cinema',
                      style: TextStyle(
                          color: const Color(0xFF0E1D54),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: cinemas.length,
              itemBuilder: (context, index) {
                final cinema = cinemas[index];
                return ListTile(
                  leading: ClipOval(
                  ),
                  title: Text(cinema['name']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cinema['distance']),
                      Row(
                        children: [
                          Icon(
                            Icons.local_movies, // Ikon untuk menunjukkan "types"
                            size: 16,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 4),
                          Text(
                            cinema['types'].join(' · '),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  isThreeLine: true,
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(page: 3),
    );
  }
}
