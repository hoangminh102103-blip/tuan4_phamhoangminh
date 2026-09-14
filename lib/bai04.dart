import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ViDienTuScreen(),
  ));
}

class ViDienTuScreen extends StatelessWidget {
  const ViDienTuScreen({super.key});

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
                  Text("My Cards", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Icon(Icons.add_circle, size: 28),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Balance", style: TextStyle(color: Colors.white70)),
                    Text("\$5250.25", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("12345678", style: TextStyle(color: Colors.white)),
                        Text("10/24", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  hanhDongNhanh(Icons.send, "Send"),
                  hanhDongNhanh(Icons.credit_card, "Pay"),
                  hanhDongNhanh(Icons.receipt_long, "Bills"),
                ],
              ),
              const SizedBox(height: 24),
              muc(Icons.bar_chart, Colors.blue, "Statistics", "Payment and Income"),
              muc(Icons.swap_horiz, Colors.orange, "Transactions", "Transaction History"),
            ],
          ),
        ),
      ),
    );
  }

  Widget hanhDongNhanh(IconData icon, String nhan) {
    return Column(
      children: [
        CircleAvatar(radius: 26, backgroundColor: Colors.deepPurple[100], child: Icon(icon, color: Colors.deepPurple)),
        const SizedBox(height: 6),
        Text(nhan),
      ],
    );
  }

  Widget muc(IconData icon, Color mau, String tieuDe, String moTa) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          CircleAvatar(backgroundColor: mau, child: Icon(icon, color: Colors.white)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tieuDe, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(moTa, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}