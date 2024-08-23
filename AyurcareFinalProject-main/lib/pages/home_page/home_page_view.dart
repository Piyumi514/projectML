import 'package:ayurcare/pages/login.dart';
import 'package:ayurcare/pages/plant_recognition.dart';
import 'package:ayurcare/pages/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const homepage());
}

// ignore: camel_case_types
class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          // Image.asset(
          //   'assets/bg./jpg', // Change the image path accordingly
          //   height: 600, // Adjust image height as needed
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          // ),
          // Top Border Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/bg_img.png', // Change the image path accordingly
              fit: BoxFit.fitWidth,
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Image
                Container(
                  margin: const EdgeInsets.only(bottom: 0),
                  child: Image.asset(
                    'assets/logo1.png',
                    width: 300,
                    height: 300,
                  ),
                ),

                // Signup Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 24, 173, 51), // Change button color to gray
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupPage()),
                    );
                    // Add your signup functionality here
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 24, 173, 51), // Change button color to gray
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginApp()),
                    );
                    // Add your signup functionality here
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                const SizedBox(height: 2), // Spacer
                const SizedBox(height: 60), // Spacer
                // Button with Icons
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PlantRecognitionPage()),
                    );
                    // Add functionality for signup button
                  },
                  child: Container(
                    width: 350,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(204, 217, 221, 217),
                          Color.fromARGB(204, 197, 205, 205),
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .center, // Align items to the center
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'Recognize the plant',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 10, 84, 10),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const PlantRecognitionPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 4, 167, 135),
                            ),
                            child: const Text(
                              'Click here',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
