import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TinhTrangScreen(),
  ));
}

class TinhTrangScreen extends StatelessWidget {
  const TinhTrangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Hi, Jared!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Icon(Icons.notifications, size: 28),
                ],
              ),
              const SizedBox(height: 20),
              const Text("How do you feel?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  camXuc("😞", "Bad"),
                  camXuc("🙂", "Fine"),
                  camXuc("😀", "Well"),
                  camXuc("😍", "Excellent"),
                ],
              ),
              const SizedBox(height: 24),
              const Text("Exercises", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              baiTap(Icons.record_voice_over, Colors.orange, "Speaking Skillz", "16 Exercises"),
              baiTap(Icons.menu_book, Colors.green, "Reading Skills", "8 Exercises"),
              baiTap(Icons.edit, Colors.pink, "Writing Skills", "20 Exercises"),
            ],
          ),
        ),
      ),
    );
  }

  Widget camXuc(String bieuTuong, String nhan) {
    return Column(
      children: [
        Text(bieuTuong, style: const TextStyle(fontSize: 32)),
        const SizedBox(height: 4),
        Text(nhan, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget baiTap(IconData icon, Color mau, String tieuDe, String moTa) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(backgroundColor: mau, child: Icon(icon, color: Colors.white)),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tieuDe, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(moTa, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}