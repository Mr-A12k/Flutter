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
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool faceIdEnabled = false;
  bool pushNotificationsEnabled = true;
  bool locationServicesEnabled = true;
  bool darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50], // Light green background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          "Profile",
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
              profileHeader(),
              const SizedBox(height: 20),
              sectionTitle("Account"),
              accountSettingTile(Icons.notifications, "Notification Setting"),
              accountSettingTile(Icons.local_shipping, "Shipping Address"),
              accountSettingTile(Icons.payment, "Payment Info"),
              accountSettingTile(Icons.people, "Manage users"),
              const SizedBox(height: 20),
              sectionTitle("App Settings"),
              settingSwitch("Enable Face ID For Log In", faceIdEnabled, (value) {
                setState(() {
                  faceIdEnabled = value;
                });
              }),
              settingSwitch("Enable Push Notifications", pushNotificationsEnabled, (value) {
                setState(() {
                  pushNotificationsEnabled = value;
                });
              }),
              settingSwitch("Enable Location Services", locationServicesEnabled, (value) {
                setState(() {
                  locationServicesEnabled = value;
                });
              }),
              settingSwitch("Dark Mode", darkModeEnabled, (value) {
                setState(() {
                  darkModeEnabled = value;
                });
              }),
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

  Widget profileHeader() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          child: Icon(Icons.person, size: 50, color: Colors.white),
        ),
        const SizedBox(height: 10),
        const Text(
          "Hello Kabix!",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const Text(
          "Have a nice day.",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
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

  Widget accountSettingTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }

  Widget settingSwitch(String title, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title, style: const TextStyle(fontSize: 16)),
      value: value,
      activeColor: Colors.green,
      onChanged: onChanged,
    );
  }
}
