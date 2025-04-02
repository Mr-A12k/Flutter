import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TaskSubmissionPage(),
    );
  }
}

class TaskSubmissionPage extends StatelessWidget {
  const TaskSubmissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9FCE8),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TaskCard(),
              const SizedBox(height: 20),
              ProgressItem(title: 'Dispose the wastes', subtitle: 'now', icon: Icons.delete),
              const SizedBox(height: 20),
              UploadImageSection(),
              const SizedBox(height: 20),
              FingerprintSection(),
              const SizedBox(height: 20),
              LocationSection(),
              const SizedBox(height: 30),
              SubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Task 1',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          const Text(
            'Clean the Hospital wash room',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.topRight,
            child: Text(
              'October 4, 2024',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const ProgressItem({required this.title, required this.subtitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.green, size: 40),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(subtitle, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}

class UploadImageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        uploadButton('Upload Image', Icons.upload),
        const SizedBox(height: 10),
        uploadedImage('Uploaded Image'),
        uploadedImage('Uploaded Image'),
      ],
    );
  }

  Widget uploadButton(String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(width: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget uploadedImage(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.image, color: Colors.grey),
          const SizedBox(width: 10),
          Text(title),
          const Spacer(),
          const Icon(Icons.close, color: Colors.red),
        ],
      ),
    );
  }
}

class FingerprintSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text('Fingerprint Authentication', style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

class LocationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Location', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        const Text('Rajapalayam - Tamil Nadu 626 227', style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 8),
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(child: Icon(Icons.map, size: 50, color: Colors.green)),
        ),
      ],
    );
  }
}

class SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () {},
      child: const Text('Submit Work', style: TextStyle(color: Colors.white, fontSize: 18)),
    );
  }
}
