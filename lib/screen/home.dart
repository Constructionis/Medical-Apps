// home_page.dart
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Menyimpan index halaman yang sedang ditampilkan

  void _onOthersPressed() {
    setState(() {
      _selectedIndex = 1; // Pindah ke halaman "Categories" saat "Others" ditekan
    });
  }

  void _onBackPressed() {
    setState(() {
      _selectedIndex = 0; // Kembali ke halaman utama
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello, Mr. Smith'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildHomePageContent(), // Halaman Utama
          _buildCategoriesPageContent(), // Halaman Categories
        ],
      ),
    );
  }

  Widget _buildHomePageContent() {
    return Column(
      children: [
        // Tombol kategori
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCategoryButton('Check up', Icons.check, Colors.blue),
              _buildCategoryButton('Drugs', Icons.medical_services, Colors.teal),
              _buildCategoryButton('Covid-19', Icons.coronavirus, Colors.orange),
              GestureDetector(
                onTap: _onOthersPressed, // Ganti ke halaman Categories
                child: _buildCategoryButton('Others', Icons.more_horiz, Colors.purple),
              ),
            ],
          ),
        ),
        // Konten lainnya untuk halaman utama
        const Center(child: Text('Content of Home Page')),
      ],
    );
  }

  Widget _buildCategoriesPageContent() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _onBackPressed, // Kembali ke halaman utama
              ),
              const Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildCategoryItem('Skin', Icons.medical_services, Colors.blue),
              _buildCategoryItem('THT', Icons.hearing, Colors.teal),
              _buildCategoryItem('Orthopedi', Icons.accessibility, Colors.orange),
              _buildCategoryItem('Brain', Icons.psychology, Colors.purple),
              _buildCategoryItem('Heart', Icons.favorite, Colors.red),
              _buildCategoryItem('Eye', Icons.visibility, Colors.amber),
              _buildCategoryItem('Nerve', Icons.wifi, Colors.blue),
              _buildCategoryItem('Sex', Icons.people, Colors.cyan),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryButton(String label, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 40.0,
            color: color,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          label,
          style: const TextStyle(fontSize: 12.0, color: Colors.black87),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(String label, IconData icon, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 40.0,
            color: color,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          label,
          style: const TextStyle(fontSize: 12.0, color: Colors.black87),
        ),
      ],
    );
  }
}
