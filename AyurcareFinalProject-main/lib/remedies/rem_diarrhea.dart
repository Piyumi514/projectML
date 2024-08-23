// ignore_for_file: camel_case_types, library_private_types_in_public_api

//import 'package:ayurcare/disease_page.dart';
import 'package:ayurcare/diseases/diarrhea.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const rem_diarrhea());
}

class rem_diarrhea extends StatelessWidget {
  const rem_diarrhea({super.key});

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
      'url': 'assets/homeremedies/Bananas.jpg',
      'details':
          'Bananas are rich in potassium and pectin, which can help firm up stools and replace lost electrolytes during diarrhea. Eat ripe bananas or blend them into a smoothie for easy digestion. ',
      'name': 'Bananas'
    },
    {
      'url': 'assets/homeremedies/gingerTea.jpg',
      'details':
          'Ginger has anti-inflammatory and antimicrobial properties that can help alleviate diarrhea symptoms. Steep fresh ginger slices in hot water to make ginger tea. Drink this tea several times a day to help reduce inflammation and relieve diarrhea. ',
      'name': 'Ginger Tea'
    },
    {
      'url': 'assets/homeremedies/Rice Water.jpg',
      'details':
          'Rice water is a traditional remedy for diarrhea in many cultures. Boil rice in water and strain the water. Drink this rice water throughout the day to help replace lost fluids and soothe the digestive tract.',
      'name': 'Rice Water'
    },
    {
      'url': 'assets/homeremedies/Coconut Water.jpg',
      'details':
          'Coconut water is rich in electrolytes and can help replenish lost fluids and minerals during diarrhea. Drink fresh coconut water throughout the day to stay hydrated and prevent dehydration. ',
      'name': 'Coconut Water'
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