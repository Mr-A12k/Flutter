import 'package:flutter/material.dart';

class FieldVisitScreen extends StatelessWidget {
  const FieldVisitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/download.jpg',
                height: 250,
                width: 250,
              ),
              const SizedBox(height: 30),
              const Text(
                'Field Visits',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Manage Inspections Efficiently',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/login'); // Navigate to Login Page
                },
                child: const Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
