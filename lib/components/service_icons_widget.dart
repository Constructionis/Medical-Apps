import 'package:flutter/material.dart';

class ServiceIconsWidget extends StatelessWidget {
  final VoidCallback onOthersPressed;
  const ServiceIconsWidget({super.key, required this.onOthersPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildServiceIcon(context, Icons.local_hospital, "Check up"),
          _buildServiceIcon(context, Icons.local_pharmacy, "Drugs"),
          _buildServiceIcon(context, Icons.coronavirus, "Covid-19"),
          GestureDetector(
            onTap: onOthersPressed,
              child: _buildServiceIcon(context,  Icons.more_horiz, "Others"),
          )
        ],
      ),
    );
  }

  Widget _buildServiceIcon(BuildContext context, IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueAccent.withOpacity(0.1),
          ),
          child: Icon(
            icon,
            color: Colors.blueAccent,
            size: 28,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
