import 'package:flutter/material.dart';
import 'package:shecareai/Screen/MenstrualTracker/menstrualtracker.dart';
import 'package:shecareai/Screen/MentalHealth/mentalhealthscreen.dart';
import 'package:shecareai/Screen/Pcos/pcosscreen.dart';
import 'package:shecareai/Screen/DietExercise/dietexercisescreen.dart';
import 'package:shecareai/Screen/login/loginscreen.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  Widget _buildFeatureCard(
      BuildContext context, {
        required String title,
        required String subtitle,
        required IconData icon,
        required Widget screen,
      }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        shadowColor: Colors.black12,
        child: Container(
          height: 130,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Icon(icon, color: Colors.black87, size: 50),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        toolbarHeight: 50,
        titleSpacing: 16,
        title: Center(
          child: const Text(
            "SheCARE AI",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black87),
            tooltip: "Logout",
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Welcome back 💕",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Empower your health with SheCARE 🌸",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),

            // 🩷 Feature Cards in F-layout
            _buildFeatureCard(
              context,
              title: "Menstrual Tracker 🩸",
              subtitle: "Predict & monitor your cycles",
              icon: Icons.calendar_month_outlined,
              screen: const MenstrualTrackerScreen(),
            ),
            _buildFeatureCard(
              context,
              title: "Mental Health 💭",
              subtitle: "Track your emotions & thoughts",
              icon: Icons.psychology_alt_outlined,
              screen: const MentalHealthScreen(),
            ),
            _buildFeatureCard(
              context,
              title: "PCOS Detection ⚕️",
              subtitle: "Check your hormonal balance",
              icon: Icons.monitor_heart_outlined,
              screen: const PcosScreen(),
            ),
            _buildFeatureCard(
              context,
              title: "Diet & Exercise 🥗",
              subtitle: "Daily nutrition and fitness tips",
              icon: Icons.fitness_center_outlined,
              screen: const DietExerciseScreen(),
            ),

            const SizedBox(height: 25),
            const Text(
              "Empowering Women's Health 💖",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
