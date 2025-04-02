import 'package:flutter/material.dart';

void main() {
  runApp(const NotificationPage());
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NotificationPagePagesPage(),
    );
  }
}

class NotificationPagePagesPage extends StatelessWidget {
  const NotificationPagePagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50], // Light background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          "NotificationPage",
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
              sectionTitle("Today"),
              NotificationPagePageCard("Work submitted", "Dispose the wastes", "2 Days ago", Colors.green[300]!),
              NotificationPagePageCard("Work not submitted", "Dispose the wastes", "2 Days ago", Colors.orange[300]!),
              const SizedBox(height: 10),
              sectionTitle("Yesterday"),
              NotificationPagePageCard("Work submitted", "Dispose the wastes", "2 Days ago", Colors.green[300]!),
              NotificationPagePageCard("Work in progress", "Dispose the wastes", "2 Days ago", Colors.grey[300]!),
              NotificationPagePageCard("Work not submitted", "Dispose the wastes", "2 Days ago", Colors.orange[300]!),
              NotificationPagePageCard("Work submitted", "Dispose the wastes", "2 Days ago", Colors.green[300]!),
              NotificationPagePageCard("Work submitted", "Dispose the wastes", "2 Days ago", Colors.green[300]!),
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
          BottomNavigationBarItem(icon: Icon(Icons.NotificationPagePages), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget NotificationPagePageCard(String status, String task, String time, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.event_note, color: color, size: 30),
        title: Text(
          status,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("$task\n$time"),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}
