import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: KhamBenhScreen(),
  ));
}

class KhamBenhScreen extends StatelessWidget {
  const KhamBenhScreen({super.key});

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
                  Text("Hello,\nMitch Koko", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  CircleAvatar(backgroundColor: Colors.deepPurple, child: Icon(Icons.person, color: Colors.white)),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.pink[100], borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("How do you feel?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const Text("Fill out your medical card right now"),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                      child: const Text("Get Started"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 8),
                    Text("How can we help you?", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  theLoai(Icons.medical_services, "Dentist"),
                  theLoai(Icons.local_hospital, "Surgeon"),
                  theLoai(Icons.favorite, "Cardio"),
                ],
              ),
              const SizedBox(height: 20),
              const Text("Doctor list", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: bacSi("Dr. Mitch Kuko", "Psychologist 7 y.e.", "4.4")),
                  const SizedBox(width: 12),
                  Expanded(child: bacSi("Dr. Steve Jobs", "Surgeon 7 y.e.", "5.0")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget theLoai(IconData icon, String nhan) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: Colors.deepPurple[50], borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, color: Colors.deepPurple),
        ),
        const SizedBox(height: 6),
        Text(nhan),
      ],
    );
  }

  Widget bacSi(String ten, String chuyenMon, String diem) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(radius: 26, backgroundColor: Colors.grey, child: Icon(Icons.person, color: Colors.white)),
          const SizedBox(height: 8),
          Row(children: [const Icon(Icons.star, color: Colors.amber, size: 16), Text(" $diem")]),
          Text(ten, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(chuyenMon, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}