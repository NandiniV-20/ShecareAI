import 'package:flutter/material.dart';

class MentalHealthScreen extends StatefulWidget {
  const MentalHealthScreen({super.key});

  @override
  State<MentalHealthScreen> createState() => _MentalHealthScreenState();
}

class _MentalHealthScreenState extends State<MentalHealthScreen> {
  String mood = "";
  final TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // ✅ White background
      appBar: AppBar(
        title: const Text(
          "Mental Health Tracker",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.pinkAccent),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "How are you feeling today? 😊",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // 😊 Mood Buttons
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  _buildMoodButton("😊", "Happy"),
                  _buildMoodButton("😔", "Sad"),
                  _buildMoodButton("😡", "Angry"),
                  _buildMoodButton("😴", "Tired"),
                  _buildMoodButton("😌", "Calm"),
                  _buildMoodButton("😵‍💫", "Stressed"),
                ],
              ),

              const SizedBox(height: 30),

              // 📝 Thought Input
              TextField(
                controller: noteController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "Write your thoughts 💬",
                  labelStyle: const TextStyle(color: Colors.black54),
                  filled: true,
                  fillColor: const Color(0xFFF8F8F8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pinkAccent),
                  ),
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 25),

              // 💾 Save Button
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    if (mood.isEmpty && noteController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please select a mood or add a note 🩷"),
                          backgroundColor: Colors.pinkAccent,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Mood logged successfully 💗"),
                          backgroundColor: Colors.pinkAccent,
                        ),
                      );
                      noteController.clear();
                      setState(() => mood = "");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Save Entry",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 💖 Footer
              const Text(
                "Remember: It's okay to feel. Take care of yourself 🌸",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMoodButton(String emoji, String moodName) {
    final bool isSelected = mood == moodName;
    return GestureDetector(
      onTap: () {
        setState(() {
          mood = moodName;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.pinkAccent : const Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.pinkAccent : Colors.black12,
          ),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.pinkAccent.withOpacity(0.3),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ]
              : [],
        ),
        child: Text(
          emoji,
          style: TextStyle(
            fontSize: 30,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
