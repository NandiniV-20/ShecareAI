import 'package:flutter/material.dart';
import 'package:shecareai/Screen/login/loginscreen.dart';
import 'package:shecareai/Screen/HomePage/homepagescreen.dart';

class Signupscreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // ✅ White background
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🌸 App Title
              const Text(
                "SheCARE AI",
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.black,
                  fontSize: 55,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 35),

              // ✉️ Email Field
              Container(
                height: 50,
                width: 320, // ✅ Fixed centered width
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // 🔒 Password Field
              Container(
                height: 50,
                width: 320,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // 👩‍💼 Username Field
              Container(
                height: 50,
                width: 320,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Username",
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // 💗 Sign Up Button
              SizedBox(
                width: 320,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>HomePageScreen() ));
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // 🔄 Already have an account?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
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
