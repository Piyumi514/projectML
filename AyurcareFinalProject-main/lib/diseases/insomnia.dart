// ignore_for_file: camel_case_types


import 'package:ayurcare/decoction/dec_insomnia.dart';
import 'package:ayurcare/pages/doctor_details.dart';
import 'package:ayurcare/pages/plant_recognition.dart';
import 'package:ayurcare/pages/submit_page.dart';
import 'package:ayurcare/remedies/rem_insomnia.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const insomnia());
}

class insomnia extends StatelessWidget {
  const insomnia({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myProject(),
    );
  }
}

class myProject extends StatelessWidget {
  const myProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  MyPage()),
              );
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/ac.png',
                fit: BoxFit.contain,
                height: 250,
                width: 120,
              ),
            ),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 25, 155, 31),
                  Color.fromARGB(255, 19, 48, 20)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 120,
                ),
                const Center(
                  child: Text(
                    "INSOMNIA",
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                        color: Color.fromARGB(255, 3, 84, 3),
                        fontSize: 35,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                        "Insomnia is a sleep disorder characterized by difficulty falling asleep, staying asleep, or experiencing non-restorative sleep despite having the opportunity to sleep. It can lead to daytime fatigue, irritability, difficulty concentrating, and other health issues if left untreated. In Sri Lanka, Ayurvedic medicine offers several remedies for managing insomnia.",
                    textAlign:TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const rem_insomnia()),
                      );
                    },
                    child: Container(
                      width: 175,
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromARGB(255, 51, 135, 53),
                      ),
                      child: const Center(
                        child: Text(
                          "Home Remedies",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const dec_insomnia()),
                      );
                    },
                    child: Container(
                       width: 175,
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromARGB(255, 51, 135, 53),
                      ),
                      child: const Center(
                        child: Text(
                          "Decoctions",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
  child: Container(
    width: 350,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20), // Rounded corners
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
      crossAxisAlignment: CrossAxisAlignment.center, // Align items to the center
      children: [
        const SizedBox(height: 10),
        const Text(
          'Connect with your districtial doctor',
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
                  builder: (context) => const DoctorPage(exportData: null,),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 4, 167, 135),
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


                const SizedBox(height: 30),
                Center(
  child: Container(
    width: 350,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20), // Rounded corners
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
      crossAxisAlignment: CrossAxisAlignment.center, // Align items to the center
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
                  builder: (context) => const PlantRecognitionPage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
               backgroundColor: const Color.fromARGB(255, 4, 167, 135),
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

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
