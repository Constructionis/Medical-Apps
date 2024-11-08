import 'package:flutter/material.dart';

class CovidServiceBar extends StatelessWidget {
  const CovidServiceBar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey[800], // Warna background bar
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          // Gambar Dokter
          Image.network(
            'https://www.inilah.com/_next/image?url=https%3A%2F%2Fc.inilah.com%2Freborn%2F2023%2F08%2F1%2F0509_110616_1b9f_inilah_com_ee50ff7c0e.jpg&w=640&q=75', // URL gambar dokter
            width: screenWidth * 0.15,
            height: screenWidth * 0.15,
            fit: BoxFit.cover,
          ),
          SizedBox(width: screenWidth * 0.04),
          // Teks "Covid-19 Service" dan Deskripsi
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Covid-19 Service',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: screenWidth * 0.01),
                Text(
                  'Get checked immediately if you have signs of Covid-19 disease',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
