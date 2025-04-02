import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InProgressPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InProgressPage extends StatelessWidget {
  const InProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFFF4),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text('In-progress',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTaskCard(),
            const SizedBox(height: 20),
            _buildSubTask(),
            const SizedBox(height: 20),
            _buildUploadSection(),
            const SizedBox(height: 20),
            _buildFingerprintButton(),
            const SizedBox(height: 20),
            _buildLocationSection(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildTaskCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFA8F0C6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Task 1',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              Text('October 4, 2024',
                  style: TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 8),
          const Text('Clean the Hospital wash room',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            'The hospital cleaner is responsible for maintaining hygiene, ensuring sanitation, and following proper waste disposal guidelines.',
            style: TextStyle(color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildSubTask() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFA8F0C6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.calendar_today, color: Colors.black),
        ),
        const SizedBox(width: 12),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dispose the wastes',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('2 Days ago', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }

  Widget _buildUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Text('Upload Image',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 12),
        _buildUploadedImage('Uploaded Image'),
        const SizedBox(height: 8),
        _buildUploadedImage('Uploaded Image'),
      ],
    );
  }

  Widget _buildUploadedImage(String imageName) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(imageName),
          const Icon(Icons.close, color: Colors.black),
        ],
      ),
    );
  }

  Widget _buildFingerprintButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Text('Fingerprint Authentication',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildLocationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Location',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('Rajapalayam - Tamil Nadu 626 227',
            style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 12),
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: const Color(0xFFA8F0C6),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(Icons.map, size: 50, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
      ],
    );
  }
}
