import 'package:flutter/material.dart';

class PcosScreen extends StatefulWidget {
  const PcosScreen({super.key});

  @override
  State<PcosScreen> createState() => _PcosScreenState();
}

class _PcosScreenState extends State<PcosScreen> {
  bool irregularPeriods = false;
  bool weightGain = false;
  bool acne = false;
  String result = "";

  void checkRisk() {
    int score = [irregularPeriods, weightGain, acne].where((e) => e).length;

    if (score == 0) {
      result = "Low Risk 💗";
    } else if (score == 1) {
      result = "Moderate Risk 💜";
    } else {
      result = "High Risk ⚠️";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // ✅ Clean white background
      appBar: AppBar(
        title: const Text(
          "PCOS Risk Detection",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.pinkAccent),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 340), // ✅ Centered layout
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Answer a few quick questions to check your PCOS risk 💫",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),

                // 🩸 Questions
                _buildCheckboxTile(
                  "Irregular periods",
                  irregularPeriods,
                      (val) => setState(() => irregularPeriods = val!),
                ),
                _buildCheckboxTile(
                  "Weight gain or difficulty losing weight",
                  weightGain,
                      (val) => setState(() => weightGain = val!),
                ),
                _buildCheckboxTile(
                  "Acne or oily skin",
                  acne,
                      (val) => setState(() => acne = val!),
                ),

                const SizedBox(height: 25),

                // 💗 Check Risk Button
                SizedBox(
                  width: 300,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: checkRisk,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Check Risk",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // 🌷 Result Card
                if (result.isNotEmpty)
                  Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 16),
                      child: Column(
                        children: [
                          const Text(
                            "Your PCOS Risk Result:",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            result,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: result.contains("High")
                                  ? Colors.redAccent
                                  : (result.contains("Moderate")
                                  ? Colors.deepPurpleAccent
                                  : Colors.green),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _getAdviceText(),
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
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🧩 Reusable Checkbox Tile
  Widget _buildCheckboxTile(String title, bool value, Function(bool?) onChanged) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black12),
      ),
      child: CheckboxListTile(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        activeColor: Colors.pinkAccent,
        value: value,
        onChanged: onChanged,
      ),
    );
  }

  // 🌼 Advice based on result
  String _getAdviceText() {
    if (result.contains("Low")) {
      return "You're doing great! Keep maintaining a healthy lifestyle 💕";
    } else if (result.contains("Moderate")) {
      return "Monitor your symptoms regularly and maintain a balanced diet 🌿";
    } else {
      return "Consider consulting a gynecologist for proper diagnosis and care 🩺";
    }
  }
}
