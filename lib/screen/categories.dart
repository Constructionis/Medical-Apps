import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCategoryItem('skin', Icons.medical_services, Colors.blue),
          _buildCategoryItem('THT', Icons.hearing, Colors.teal),
          _buildCategoryItem('Orthopedi', Icons.accessibility, Colors.orange),
          _buildCategoryItem('Brain', Icons.psychology, Colors.purple),
          _buildCategoryItem('Heart', Icons.favorite, Colors.red),
          _buildCategoryItem('Eye', Icons.visibility, Colors.amber),
          _buildCategoryItem('Nerve', Icons.wifi, Colors.blue),
          _buildCategoryItem('Sex', Icons.people, Colors.cyan),
        ],
      ),
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
