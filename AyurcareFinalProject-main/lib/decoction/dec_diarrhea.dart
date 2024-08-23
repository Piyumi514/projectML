// ignore_for_file: camel_case_types, library_private_types_in_public_api

//import 'package:ayurcare/disease_page.dart';
import 'package:ayurcare/diseases/diarrhea.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const dec_diarrhea());
}

class dec_diarrhea extends StatelessWidget {
  const dec_diarrhea({super.key});

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
                MaterialPageRoute(builder: (context) => const diarrhea()),
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
            'DECOCTIONS',
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
      'url': 'assets/homeremedies/Pomegranate Peel.jpg',
      'details':
          ' Pomegranate peel has astringent properties that can help reduce diarrhea and soothe the digestive tract. Boil pomegranate peels in water to make a decoction. Drink this decoction several times a day to help alleviate diarrhea symptoms. ',
      'name': 'Pomegranate Peel Decoction:'
    },
    {
      'url': 'assets/homeremedies/Bilva (Bael) Leaf.jpg',
      'details':
          'Bilva leaves have antimicrobial and anti-inflammatory properties that can help relieve diarrhea and promote digestive health. Boil bilva leaves in water to make a decoction. Drink this decoction several times a day to help reduce diarrhea. ',
      'name': 'Bilva (Bael) Leaf Decoction'
    },
    {
      'url': 'assets/homeremedies/Cumin Seed.jpg',
      'details':
          ' Cumin seeds have carminative and antimicrobial properties that can help alleviate diarrhea and improve digestion. Boil cumin seeds in water to make a decoction. Drink this decoction several times a day to help relieve diarrhea symptoms. ',
      'name': 'Cumin Seed Decoction'
    },
    {
      'url': 'assets/homeremedies/Fenugreek.jpg',
      'details':
          ' Fenugreek seeds have astringent properties that can help reduce diarrhea and soothe the digestive tract. Boil fenugreek seeds in water to make a decoction. Drink this decoction several times a day to help alleviate diarrhea. ',
      'name': 'Fenugreek Seed Decoction'
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