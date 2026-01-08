import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MenstrualTrackerScreen extends StatefulWidget {
  const MenstrualTrackerScreen({super.key});

  @override
  State<MenstrualTrackerScreen> createState() => _MenstrualTrackerScreenState();
}

class _MenstrualTrackerScreenState extends State<MenstrualTrackerScreen> {
  DateTime? selectedDate;
  String? nextCycle;
  String? ovulationDate;
  String? fertileWindow;
  bool isLoading = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        nextCycle = null;
        ovulationDate = null;
        fertileWindow = null;
      });
    }
  }

  /// 🌷 Local Prediction (no backend)
  void _predictCycleDetails() async {
    if (selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select your last period date 💗"),
          backgroundColor: Colors.pinkAccent,
        ),
      );
      return;
    }

    setState(() => isLoading = true);

    // Simulate model logic: average cycle = 28 days, ovulation ~ day 14
    await Future.delayed(const Duration(seconds: 1)); // simulate delay
    final nextCycleDate = selectedDate!.add(const Duration(days: 28));
    final ovulationDay = selectedDate!.add(const Duration(days: 14));
    final fertileStart = selectedDate!.add(const Duration(days: 10));
    final fertileEnd = selectedDate!.add(const Duration(days: 15));

    setState(() {
      nextCycle = DateFormat('dd MMM yyyy').format(nextCycleDate);
      ovulationDate = DateFormat('dd MMM yyyy').format(ovulationDay);
      fertileWindow =
      "${DateFormat('dd MMM').format(fertileStart)} - ${DateFormat('dd MMM yyyy').format(fertileEnd)}";
      isLoading = false;
    });
  }

  Widget _buildInfoCard(
      String title, String value, String emoji, Color color, String tip) {
    return Card(
      elevation: 6,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            Text(
              "$emoji $title",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              tip,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Menstrual Tracker",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.pinkAccent),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.favorite, color: Colors.pinkAccent, size: 90),
              const SizedBox(height: 6),
              const Text(
                "Track Your Cycle & Fertility 🌸",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // 📅 Select Date Button
              SizedBox(
                width: 300,
                height: 40,
                child: ElevatedButton(
                  onPressed: () => _selectDate(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    "Select Last Period Date",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              if (selectedDate != null)
                Text(
                  "Last Period: ${DateFormat('dd MMM yyyy').format(selectedDate!)}",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              const SizedBox(height: 25),

              // 🔮 Predict Button
              SizedBox(
                width: 300,
                height: 40,
                child: ElevatedButton(
                  onPressed: _predictCycleDetails,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    "Predict Cycle Details",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              if (isLoading)
                const CircularProgressIndicator(color: Colors.pinkAccent),

              if (!isLoading && nextCycle != null)
                Column(
                  children: [
                    const SizedBox(height: 10),
                    _buildInfoCard(
                      "Next Cycle 💖",
                      nextCycle!,
                      "🩸",
                      Colors.pinkAccent,
                      "Estimated start of your next period.",
                    ),
                    const SizedBox(height: 15),
                    _buildInfoCard(
                      "Ovulation Day 🌼",
                      ovulationDate!,
                      "🌸",
                      Colors.deepPurpleAccent,
                      "Your most fertile day.",
                    ),
                    const SizedBox(height: 15),
                    _buildInfoCard(
                      "Fertile Window 🌿",
                      fertileWindow!,
                      "💫",
                      Colors.teal,
                      "Track your fertility window.",
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
