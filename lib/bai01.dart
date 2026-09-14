import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MayTinhScreen(),
  ));
}

class MayTinhScreen extends StatefulWidget {
  const MayTinhScreen({super.key});

  @override
  State<MayTinhScreen> createState() => _MayTinhScreenState();
}

class _MayTinhScreenState extends State<MayTinhScreen> {
  String manHinh = "0";

  void bamPhim(String phim) {
    setState(() {
      // 1. Phím xóa tất cả hoặc CE: đưa về 0
      if (phim == "C" || phim == "CE") {
        manHinh = "0";
        return;
      }

      // 2. Phím xóa lùi 1 ký tự
      if (phim == "DEL") {
        if (manHinh.length > 1) {
          manHinh = manHinh.substring(0, manHinh.length - 1);
        } else {
          manHinh = "0";
        }
        return;
      }

      // 3. Phím đảo dấu (+/-)
      if (phim == "+/-") {
        if (manHinh != "0") {
          if (manHinh.startsWith("-")) {
            manHinh = manHinh.substring(1);
          } else {
            manHinh = "-$manHinh";
          }
        }
        return;
      }

      // 4. Phím tính kết quả (=)
      if (phim == "=") {
        String toanTu = "";
        for (String op in ["+", "-", "x", "/"]) {
          if (manHinh.contains(op)) {
            toanTu = op;
            break;
          }
        }

        if (toanTu.isNotEmpty) {
          List<String> phanTu = manHinh.split(toanTu);
          
          if (phanTu.length == 2 && phanTu[1].isNotEmpty) {
            double soA = double.parse(phanTu[0]);
            double soB = double.parse(phanTu[1]);
            double ketQua = 0;

            if (toanTu == "+") ketQua = soA + soB;
            if (toanTu == "-") ketQua = soA - soB;
            if (toanTu == "x") ketQua = soA * soB;
            if (toanTu == "/") ketQua = soA / soB;

            if (ketQua % 1 == 0) {
              manHinh = ketQua.toInt().toString();
            } else {
              manHinh = ketQua.toString();
            }
          }
        }
        return;
      }

      // 5. Phím toán tử (+, -, x, /)
      if (phim == "+" || phim == "-" || phim == "x" || phim == "/") {
        bool daCoToanTu = manHinh.contains("+") ||
            manHinh.contains("-") ||
            manHinh.contains("x") ||
            manHinh.contains("/");

        if (!daCoToanTu) {
          manHinh += phim;
        }
        return;
      }

      // 6. Dấu chấm thập phân
      if (phim == ".") {
        manHinh += ".";
        return;
      }

      // 7. Nhập số thông thường
      if (manHinh == "0") {
        manHinh = phim;
      } else {
        manHinh += phim;
      }
    });
  }

  Widget nutBam(String chu, {Widget? icon, bool mauXanh = false}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: AspectRatio(
          aspectRatio: 1.15,
          child: ElevatedButton(
            onPressed: () => bamPhim(chu),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child:Text(chu, style: const TextStyle(fontSize: 18)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: AppBar(
        title: const Text("Standard"),
        backgroundColor: Colors.transparent
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 235, 240, 245),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 40),
            ListTile(
              leading: const Icon(Icons.calculate_outlined),
              title: const Text("Standard"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.science_outlined),
              title: const Text("Scientific"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.show_chart),
              title: const Text("Graphing"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text("Programmer"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today_outlined),
              title: const Text("Date calculation"),
              onTap: () => Navigator.pop(context),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.currency_exchange),
              title: const Text("Currency"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text("Settings"),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Khu vực hiển thị số
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
                child: Text(
                  manHinh,
                  style: const TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              children: [
                Row(children: [
                  nutBam("%"),
                  nutBam("CE"),
                  nutBam("C"),
                  nutBam("DEL"),
                ]),
                Row(children: [nutBam("7"), nutBam("8"), nutBam("9"), nutBam("/")]),
                Row(children: [nutBam("4"), nutBam("5"), nutBam("6"), nutBam("x")]),
                Row(children: [nutBam("1"), nutBam("2"), nutBam("3"), nutBam("-")]),
                Row(children: [
                  nutBam("+/-"),
                  nutBam("0"),
                  nutBam("."),
                  nutBam("+"),
                ]),
                Row(children: [
                  const Expanded(child: SizedBox()),
                  const Expanded(child: SizedBox()),
                  const Expanded(child: SizedBox()),
                  nutBam("=", mauXanh: true),
                ]),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}