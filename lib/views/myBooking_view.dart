import 'package:flutter/material.dart';
import 'package:flutter_application_5/widgets/bottom_nav.dart';

class MyBookingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Booking'),
        backgroundColor: const Color(0xFF0E1D54),
        foregroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: Icon(Icons.timer),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "There's no active booking!",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16),
              BookingCard(
                image: 'moana2.jpeg',
                title: 'MOANA 2',
                rating: 9.5,
                genre: 'Animation',
                ageRating: '13+',
              ),
              SizedBox(height: 8),
              BookingCard(
                image: 'ibutiada.jpeg',
                title: 'BILA ESOK IBU TIADA',
                rating: 8.0,
                genre: 'Drama, Family',
                ageRating: '13+',
              ),
              SizedBox(height: 8),
              BookingCard(
                image: 'inside_out.jpeg',
                title: 'INSIDE OUT',
                rating: 9.3,
                genre: 'Animation',
                ageRating: '12+',
              ),
              SizedBox(height: 8),
              BookingCard(
                image: 'tangled.jpg',
                title: 'TANGLED',
                rating: 9.2,
                genre: 'Animation',
                ageRating: '12+',
              ),
              SizedBox(height: 8),
              BookingCard(
                image: 'agak_laen.jpeg',
                title: 'AGAK LAEN',
                rating: 9.6,
                genre: 'Horor, Comedy',
                ageRating: '17+',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(page: 1,),    
    );
  }
}

class BookingCard extends StatelessWidget {
  final String image;
  final String title;
  final double rating;
  final String genre;
  final String ageRating;

  BookingCard({
    required this.image,
    required this.title,
    required this.rating,
    required this.genre,
    required this.ageRating,
  });

  @override
  Widget build(BuildContext context) {
    print('Building BookingCard for $title');
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  genre,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      ageRating,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.star, color: Colors.yellow[700], size: 16),
                    Text(
                      '$rating',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

