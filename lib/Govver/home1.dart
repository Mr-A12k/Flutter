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
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {Navigator.pushNamed(context, '/search');},
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Hello Kabix!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text("Have a nice day."),
            const SizedBox(height: 10),
           Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
      ),
    ),
    child: const Text("My Tasks"),
  ),
),
            const SizedBox(height: 20),
            taskCardSection(),
            const SizedBox(height: 20),
            const Text("Progress", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: Column(
                children: [
                  progressItem("Dispose the wastes", "2 days ago"),
                  progressItem("Dispose the wastes", "2 days ago"),
                  progressItem("Dispose the wastes", "2 days ago"),
                  progressItem("Dispose the wastes", "2 days ago"),
                  progressItem("Dispose the wastes", "2 days ago"),
                  progressItem("Dispose the wastes", "2 days ago"),
                  progressItem("Dispose the wastes", "2 days ago"),
                  progressItem("Dispose the wastes", "2 days ago"),
                  progressItem("Dispose the wastes", "2 days ago")
                ],
              ),
            ),
          ],
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
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.green),
            accountName: const Text("Kabix", style: TextStyle(fontSize: 18)),
            accountEmail: const Text("kabix@email.com"),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 50, color: Colors.green),
            ),
          ),
          drawerItem(Icons.home, "Home"),
          drawerItem(Icons.search, "Explore"),
          drawerItem(Icons.notifications, "Notification"),
          drawerItem(Icons.location_on, "My Location"),
          drawerItem(Icons.settings, "Settings"),
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout", style: TextStyle(color: Colors.red)),
            onTap: () {
  Navigator.pushNamed(context, '/login');
},
          ),
        ],
      ),
    );
  }

  Widget drawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: () {},
    );
  }
}
// drawer end here

Widget taskCardSection() {
  return SizedBox(
    height: 150,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        taskCard(),
        taskCard(),
        taskCard(),
        taskCard(),
        taskCard(),
        taskCard()
      ],
    ),
  );
}

Widget taskCard() {
  return Container(
    width: 200,
    margin: const EdgeInsets.only(right: 10),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Colors.green, Colors.lightGreen],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Task 1", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        const Text("Clean the Hospital wash room", style: TextStyle(color: Colors.white, fontSize: 14)),
        const Spacer(),
        const Text("October 4, 2024", style: TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    ),
  );
}

Widget progressItem(String title, String time) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.green),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.calendar_today, color: Colors.green),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(time, style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ],
        ),
        const Icon(Icons.more_vert, color: Colors.grey),
      ],
    ),
  );
}