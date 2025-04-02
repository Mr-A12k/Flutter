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
      home: const TaskDetailsPage(),
    );
  }
}

class TaskDetailsPage extends StatefulWidget {
  const TaskDetailsPage({super.key});

  @override
  _TaskDetailsPageState createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  List<String> uploadedImages = [];

  void _uploadImage() {
    setState(() {
      uploadedImages.add("Uploaded Image");
    });
  }

  void _removeImage(int index) {
    setState(() {
      uploadedImages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50], // Light green background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          "In-progress",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              taskCard(),
              const SizedBox(height: 20),
              subTaskItem("Dispose the wastes", "Now"),
              const SizedBox(height: 15),
              uploadButton(),
              ...uploadedImages.asMap().entries.map((entry) {
                return uploadedImageTile(entry.key);
              }).toList(),
              const SizedBox(height: 15),
              fingerprintAuthButton(),
              const SizedBox(height: 15),
              locationSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }

  Widget taskCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.task, color: Colors.black),
                  SizedBox(width: 8),
                  Text(
                    "Task 1",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                "October 4, 2024",
                style: TextStyle(fontSize: 14, color: Colors.grey[800]),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "Clean the Hospital wash room",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "The hospital cleaner is responsible for maintaining a clean, safe, and hygienic environment. Their duties include cleaning and disinfecting patient rooms, beds, furniture, and high-touch surfaces to prevent infections. They sweep, mop, and vacuum hallways, ensuring dust and dirt are removed.",
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget subTaskItem(String title, String time) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                time,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget uploadButton() {
    return GestureDetector(
      onTap: _uploadImage,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.green),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.upload, color: Colors.green),
            SizedBox(width: 8),
            Text(
              "Upload Image",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget uploadedImageTile(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.image, color: Colors.green),
          const Text(
            "Uploaded Image",
            style: TextStyle(fontSize: 16),
          ),
          GestureDetector(
            onTap: () => _removeImage(index),
            child: const Icon(Icons.close, color: Colors.red),
          ),
        ],
      ),
    );
  }

  Widget fingerprintAuthButton() {
    return GestureDetector(
      onTap: () {
        // Implement Fingerprint Authentication Logic Here
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.green),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.fingerprint, color: Colors.green),
            SizedBox(width: 8),
            Text(
              "Fingerprint Authentication",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget locationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Location",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const Text(
          "Rajapalayam - Tamil Nadu 626 227",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: const Icon(Icons.map, color: Colors.green, size: 50),
        ),
      ],
    );
  }
}
