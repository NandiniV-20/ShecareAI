import 'package:flutter/material.dart';

class DietExerciseScreen extends StatelessWidget {
  const DietExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // ✅ White background
      appBar: AppBar(
        title: const Text(
          "Diet & Exercise",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.pinkAccent),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          SizedBox(height: 10),
          Text(
            "Your Daily Wellness Guide 🌸",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25),

          // 🥗 Diet Tips
          ListTile(
            leading: Icon(Icons.local_dining, color: Colors.pinkAccent, size: 28),
            title: Text(
              "Eat leafy greens, fresh fruits, and fiber-rich foods 🍎🥬",
              style: TextStyle(color: Colors.black, fontSize: 16, height: 1.5),
            ),
          ),
          ListTile(
            leading: Icon(Icons.water_drop, color: Colors.teal, size: 28),
            title: Text(
              "Drink at least 8 glasses of water daily 💧",
              style: TextStyle(color: Colors.black, fontSize: 16, height: 1.5),
            ),
          ),
          ListTile(
            leading: Icon(Icons.self_improvement, color: Colors.deepPurpleAccent, size: 28),
            title: Text(
              "Practice yoga or meditation to reduce stress 🧘‍♀️",
              style: TextStyle(color: Colors.black, fontSize: 16, height: 1.5),
            ),
          ),
          ListTile(
            leading: Icon(Icons.directions_run, color: Colors.orangeAccent, size: 28),
            title: Text(
              "Engage in light physical activity like walking or cycling 🚴‍♀️",
              style: TextStyle(color: Colors.black, fontSize: 16, height: 1.5),
            ),
          ),
          ListTile(
            leading: Icon(Icons.bedtime, color: Colors.indigo, size: 28),
            title: Text(
              "Sleep 7–8 hours daily — your body heals as you rest 🌙",
              style: TextStyle(color: Colors.black, fontSize: 16, height: 1.5),
            ),
          ),

          SizedBox(height: 30),

          // 🌷 Footer
          Center(
            child: Text(
              "“Healthy mind, healthy body — care for both 💖”",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
