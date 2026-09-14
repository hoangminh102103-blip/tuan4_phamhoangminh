import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CoSoVatChatScreen(),
  ));
}

class CoSoVatChatScreen extends StatefulWidget {
  const CoSoVatChatScreen({super.key});

  @override
  State<CoSoVatChatScreen> createState() => _CoSoVatChatScreenState();
}

class _CoSoVatChatScreenState extends State<CoSoVatChatScreen> {
  int chiSoDangChon = 0;

  static const List<Widget> cacTrang = <Widget>[
    Center(child: Text("Phòng học", style: TextStyle(fontSize: 26))),
    Center(child: Text("Thư viện", style: TextStyle(fontSize: 26))),
    Center(child: Text("Phòng Lab", style: TextStyle(fontSize: 26))),
  ];

  void chonTrang(int chiSo) {
    setState(() {
      chiSoDangChon = chiSo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cơ sở vật chất trường")),
      body: Center(child: cacTrang.elementAt(chiSoDangChon)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: chiSoDangChon,
        onTap: chonTrang,
        selectedItemColor: Colors.blue[900],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.meeting_room), label: "Phòng học"),
          BottomNavigationBarItem(icon: Icon(Icons.local_library), label: "Thư viện"),
          BottomNavigationBarItem(icon: Icon(Icons.computer), label: "Phòng Lab"),
        ],
      ),
    );
  }
}