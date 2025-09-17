import 'package:flutter/material.dart';

class EventsDashboardPage extends StatelessWidget {
  const EventsDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event\'s Dashboard'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          'This is the Event\'s Dashboard Page!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
