import 'package:flutter/material.dart';
import 'components/top_bar.dart';
import 'components/covid_service_bar.dart';
import 'components/service_icons_widget.dart';
import 'components/history_section.dart';
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

  // Function to update the page when a bottom navigation item is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // List of pages that will be displayed based on the selected navigation item
  List<Widget> _pages(BuildContext context) => <Widget>[
    // Home screen layout
    SingleChildScrollView(
      child: Column(
        children: [
          const TopBar(),
          const SizedBox(height: 10),
          const CovidServiceBar(),
          const SizedBox(height: 10),
          ServiceIconsWidget(
            onOthersPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CategoriesPage()),
              );
            },
          ),
          const SizedBox(height: 20),
          const HistorySection(),
        ],
      ),
    ),

    // Chat screen layout
    ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        ChatItem(
          name: 'Mai Borzovich',
          message: 'Get Well Soon',
          time: '4m',
          unreadCount: 2,
          avatarColor: Colors.green,
        ),
        ChatItem(
          name: 'Allison Park',
          message: 'Miss you',
          time: '3h',
          unreadCount: 6,
          avatarColor: Colors.orange,
        ),
        ChatItem(
          name: 'Max Schumacher',
          message: 'Hello',
          time: '20m',
          unreadCount: 1,
          avatarColor: Colors.red,
        ),
      ],
    ),

    // Appointments screen layout
    AppointmentScreen(),

    // Profile screen layout
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final pages = _pages(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[_selectedIndex],
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

// AppointmentScreen widget
class AppointmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        AppointmentItem(
          doctorName: 'Dr. John Doe',
          specialty: 'Cardiologist',
          date: 'Mon, 15 Nov 2024',
          time: '10:00 AM',
        ),
        AppointmentItem(
          doctorName: 'Dr. Emma Smith',
          specialty: 'Dentist',
          date: 'Wed, 17 Nov 2024',
          time: '2:00 PM',
        ),
        AppointmentItem(
          doctorName: 'Dr. James Williams',
          specialty: 'Dermatologist',
          date: 'Fri, 19 Nov 2024',
          time: '11:30 AM',
        ),
      ],
    );
  }
}

// AppointmentItem widget
class AppointmentItem extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String date;
  final String time;

  const AppointmentItem({
    required this.doctorName,
    required this.specialty,
    required this.date,
    required this.time,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctorName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              specialty,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  time,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ProfileScreen widget
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue,
            child: const Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 16),
          const Text(
            'Asep Turbo',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'asep33@gmail.com',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 24),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Handle settings tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help & Support'),
            onTap: () {
              // Handle help tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Handle logout tap
            },
          ),
        ],
      ),
    );
  }
}

// ChatItem widget definition as a StatelessWidget
class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final int unreadCount;
  final MaterialColor avatarColor;

  const ChatItem({
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
    required this.avatarColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: avatarColor,
        child: Text(name[0]), // First letter of the name
      ),
      title: Text(name),
      subtitle: Text(message),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time),
          if (unreadCount > 0)
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.red,
              child: Text(
                unreadCount.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}
