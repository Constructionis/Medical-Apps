import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Messages Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0), // Adjusts the distance from the bottom
        child: FloatingActionButton.extended(
        onPressed: (){

        },
        label: const Text('New Chat'),
        icon: const Icon(Icons.insert_comment),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked, // Positions it above the nav button
    );
  }
}
