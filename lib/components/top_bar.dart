import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Bagian Profil
          Row(
            children: [
              // Ikon Foto Profil
              const CircleAvatar(
                radius: 24, // ukuran ikon profil
                backgroundImage: AssetImage('assets/images/profile.jpeg',
                ),
              ),
              const SizedBox(width: 10),
              // Nama dan Alamat
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hello, Asep!', // Nama pengguna
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Purbalingga, Jawa Tengah', // Alamat
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Ikon Notifikasi
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.grey[700],
              size: 28,
            ),
            onPressed: () {
              // Aksi ketika ikon notifikasi ditekan
            },
          ),
        ],
      ),
    );
  }
}
