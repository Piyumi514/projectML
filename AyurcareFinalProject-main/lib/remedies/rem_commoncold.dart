// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:ayurcare/diseases/common_cold.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const rem_commoncold());
}

class rem_commoncold extends StatelessWidget {
  const rem_commoncold({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Remedies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                MaterialPageRoute(builder: (context) => const common_cold()),
              );
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/ac.png', // Assuming 'logo.png' is your logo file path
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
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            'HOME REMEDIES',
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 17, 88, 13)),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Click on an image to see the details',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 20),
                  ImageSwapper(), // Custom Widget for image swapping
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageSwapper extends StatefulWidget {
  const ImageSwapper({super.key});

  @override
  _ImageSwapperState createState() => _ImageSwapperState();
}

class _ImageSwapperState extends State<ImageSwapper> {
  List<Map<String, String>> imageDetails = [
    {
      'url': 'assets/homeremedies/gingerTea.jpg',
      'details':
          'Ginger has natural anti-inflammatory and antiviral properties that can help soothe a sore throat and reduce congestion. To make ginger tea, simmer fresh ginger slices in water for about 10 minutes, strain, and add honey or lemon for flavor.',
      'name': 'Ginger Tea'
    },
    {
      'url': 'assets/homeremedies/Turmeric Milk.jpg',
      'details':
          'Turmeric is known for its antimicrobial properties. Mix a teaspoon of turmeric powder into a glass of warm milk and drink it before bedtime to relieve cold symptoms. ',
      'name': 'Turmeric Milk'
    },
    {
      'url': 'assets/homeremedies/Steam Inhalation.jpg',
      'details':
          ' Inhaling steam can help clear nasal congestion and soothe irritated sinuses. Boil water in a pot, remove from heat, and lean over the pot with a towel covering your head to trap the steam. Breathe deeply for several minutes. ',
      'name': 'Steam Inhalation'
    },
    {
      'url': 'assets/homeremedies/Honey and Lemon.jpg',
      'details':
          'Mix a tablespoon of honey with freshly squeezed lemon juice in warm water. This mixture can help soothe a sore throat and boost the immune system. ',
      'name': 'Honey and Lemon'
    },
  ];

  int _selectedImageIndex = -1;

  void _toggleDetails(int index) {
    setState(() {
      if (_selectedImageIndex == index) {
        _selectedImageIndex = -1;
      } else {
        _selectedImageIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: imageDetails.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    imageDetails[index]['name']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  InkWell(
                    onTap: () {
                      _toggleDetails(index);
                    },
                    child: Image.asset(
                      imageDetails[index]['url']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            if (_selectedImageIndex == index)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    imageDetails[index]['details']!,
                    style: const TextStyle(fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            const SizedBox(height: 30), // Added more space between pictures
          ],
        );
      },
    );
  }
}