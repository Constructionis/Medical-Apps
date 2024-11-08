import 'package:flutter/material.dart';
import 'screen/appointment.dart';
import 'components/top_bar.dart';
import 'components/covid_service_bar.dart';
import 'components/service_icons_widget.dart';
import 'components/history_section.dart';
import 'screen/home.dart';
import 'screen/categories.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Function untuk update halaman ketika bottom navigation di-tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // List dari halaman yang akan ditampilkan saat navigasi dipilih
  List<Widget> _pages(BuildContext context) => <Widget>[
    // Saat ini semua halaman adalah MainScreen sebagai contoh
    // Anda bisa menggantinya dengan halaman lain
    Column(
      children: [
        const TopBar(),
        const SizedBox(height: 10),
        const CovidServiceBar(),
        const SizedBox(height: 10),
        ServiceIconsWidget(
          onOthersPressed: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => const CategoriesPage()),
            );
          }
        ),
        const SizedBox(height: 20),
        const HistorySection(),
      ],
    ),
    const Center(child: Text('Chat')),
    const Center(child: Text('Appointments ')),
    const Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    final pages = _pages(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: pages[_selectedIndex],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('FAB clicked')),
            );
          },
          child: const Icon(Icons.insert_comment),
          tooltip: 'New Chat',
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
