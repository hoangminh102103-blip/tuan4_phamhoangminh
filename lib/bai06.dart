import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NgheNhacScreen(),
  ));
}

class NgheNhacScreen extends StatelessWidget {
  const NgheNhacScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.arrow_back),
                  Text("PLAYLIST", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2)),
                  Icon(Icons.menu),
                ],
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  "assets/images/album.jpg",
                  width: double.infinity,
                  height: 280,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 280,
                      color: Colors.grey[300],
                      child: const Icon(Icons.music_note, size: 80, color: Colors.grey),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Kota The Friend", style: TextStyle(color: Colors.grey)),
                      Text("Birdie", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Icon(Icons.favorite, color: Colors.red),
                ],
              ),
              const SizedBox(height: 16),
              const LinearProgressIndicator(value: 0.5, color: Colors.green, backgroundColor: Colors.grey),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("0:00"),
                  Text("4:22"),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.skip_previous, size: 36),
                  Icon(Icons.play_arrow, size: 48),
                  Icon(Icons.skip_next, size: 36),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}