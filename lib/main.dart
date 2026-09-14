import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

// Widget Drawer dùng chung cho mọi màn hình
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.pop(context); // Đóng drawer trước
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 197, 218, 238),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountEmail: const Text("vinhvv@huit.edu.vn"),
            accountName: const Text("Vũ văn vinh"),
            currentAccountPictureSize: const Size.square(50),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.asset(
                  "assets/image.png",
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home trang chủ"),
            onTap: () => _navigateTo(context, const HomeScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.crop_square),
            title: const Text("1. Demo Container"),
            onTap: () => _navigateTo(context, const HomeContainer()),
          ),
          ListTile(
            leading: const Icon(Icons.view_column),
            title: const Text("2. Demo Row & Column"),
            onTap: () => _navigateTo(context, const DemoRowColumn()),
          ),
          ListTile(
            leading: const Icon(Icons.layers),
            title: const Text("3. Demo Stack"),
            onTap: () => _navigateTo(context, const DemoStack()),
          ),
          ListTile(
            leading: const Icon(Icons.web),
            title: const Text("4. Demo Custom AppBar"),
            onTap: () => _navigateTo(context, const DemoAppBar()),
          ),
          ListTile(
            leading: const Icon(Icons.navigation),
            title: const Text("5. Demo BottomNavigationBar"),
            onTap: () => _navigateTo(context, const DemoBottomNavBar()),
          ),
        ],
      ),
    );
  }
}

// 0. HomeScreen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer Demo"),
        backgroundColor: Colors.blue,
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Test cái drawer", style: TextStyle(fontSize: 30)),
      ),
    );
  }
}

// 1. Container Demo
class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đây là container"),
        backgroundColor: Colors.yellow,
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(2, 4),
              ),
            ],
          ),
          child: const Text(
            "Nội dung HomeContainer",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

// 2. Row & Column Demo
class DemoRowColumn extends StatelessWidget {
  const DemoRowColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Row & Column"),
        backgroundColor: Colors.blue,
      ),
      drawer: const AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.green,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.blue,
            width: 200,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.yellow,
                  width: 50,
                  height: 50,
                ),
                Container(
                  color: Colors.purple,
                  width: 50,
                  height: 50,
                ),
                Container(
                  color: const Color.fromARGB(255, 19, 213, 32),
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 3. Stack Demo
class DemoStack extends StatelessWidget {
  const DemoStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Stack"),
        backgroundColor: Colors.blue,
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.blue,
              width: 200,
              height: 200,
            ),
            Container(
              color: Colors.red,
              width: 150,
              height: 150,
            ),
            Positioned(
              right: 50,
              left: 50,
              top: 10,
              child: Container(
                color: Colors.green,
                width: 80,
                height: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 4. Custom AppBar Demo
class DemoAppBar extends StatelessWidget {
  const DemoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "AppBar Demo",
          style: TextStyle(color: Color.fromARGB(255, 237, 148, 23)),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 31, 4, 239),
        toolbarHeight: 50,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Màn hình Custom AppBar bo tròn góc"),
      ),
    );
  }
}

// 5. BottomNavigationBar Demo
class DemoBottomNavBar extends StatefulWidget {
  const DemoBottomNavBar({super.key});

  @override
  State<DemoBottomNavBar> createState() => _DemoBottomNavBarState();
}

class _DemoBottomNavBarState extends State<DemoBottomNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text('HOME PAGE', style: optionStyle),
    Text('COURSE PAGE', style: optionStyle),
    Text('CONTACT GFG', style: optionStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BottomNavigationBar Demo"),
        backgroundColor: Colors.cyan,
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.cyan,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Course',
            backgroundColor: Colors.cyan,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Contact',
            backgroundColor: Colors.cyan,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}