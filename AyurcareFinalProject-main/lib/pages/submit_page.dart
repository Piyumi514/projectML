import 'package:ayurcare/bloc/remedy_bloc.dart';
import 'package:ayurcare/db/models/decoction_model.dart';
import 'package:ayurcare/db/repository/diseases_repo.dart';
import 'package:ayurcare/db/repository/remedy_repo.dart';
import 'package:ayurcare/diseases/common_cold.dart';
import 'package:ayurcare/diseases/constipation.dart';
import 'package:ayurcare/diseases/diarrhea.dart';
import 'package:ayurcare/diseases/disease_page.dart';
import 'package:ayurcare/diseases/fever.dart';
import 'package:ayurcare/diseases/hairloss.dart';
import 'package:ayurcare/diseases/headache.dart';
import 'package:ayurcare/diseases/indigestion.dart';
import 'package:ayurcare/diseases/insomnia.dart';
import 'package:ayurcare/diseases/jointpain.dart';
import 'package:ayurcare/diseases/nausea.dart';
import 'package:ayurcare/diseases/skinallergies.dart';
import 'package:ayurcare/diseases/toothache.dart';
import 'package:ayurcare/events/remedy_event.dart';
import 'package:ayurcare/pages/home_page/home_page_view.dart';
import 'package:ayurcare/pages/plant_recognition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../db/models/remedy_model.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RemedyBloc(),
      child: MyPageView(),
    );
  }
}


class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageState();
}

class _MyPageState extends State<MyPageView> {
  final DiseasesRepo diseasesRepo = DiseasesRepo();
  List<DiseasesModel> diseaseList = [];
  getDiseases() async {
    final list = await diseasesRepo.getDiseases();
    setState(() {
      diseaseList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<RemedyBloc>(context);
    if (diseaseList.length == 0) {
      getDiseases();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            leading: BackButton(
              color: Colors.white,

              // icon: Icon(Icons.arrow_back),
              onPressed: () {
                //GestureDetector(
                //onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const homepage()),
                  // );
                  //},
                );

                // Handle back button press here
                //Navigator.of(context).pop();
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 0),
                child: Image.asset(
                  'assets/logo1.png',
                  width: 300,
                  height: 300,
                ),
              ),

              // Add space between top image and select box
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: const Text('Select the Disease'),
                  onChanged: (newValue) {
                    counterBloc.add(AddRemedy(newValue ?? ""));
                    if (newValue == 'Asthma (ඇදුම)') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const disease()),
                      );
                    } else if (newValue == 'Common cold (සෙම්ප්‍රතිශ්‍යාව)') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const common_cold()),
                      );
                    } else if (newValue == 'Indigestion (අජීර්ණය)') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const indigestion()),
                      );
                    } else if (newValue == 'Headache (හිසරදය)') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const headache()),
                      );
                    } else if (newValue ==
                        'Joint Pain/Arthritis (හන්දිපත් රුදාව)') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const jointpain()),
                      );
                    } else if (newValue == 'Insomnia (නින්ද නොයාම)') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const insomnia()),
                      );
                    } else if (newValue == 'Constipation (මලබද්ධය)') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const constipation()),
                      );
                    } else if (newValue == 'Toothache (දත් කැක්කුම)') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const toothache()),
                      );
                    } else if (newValue == 'Skin Allergies (සමේ අසාත්මිකතා)') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const skinallergies()),
                      );
                    } else if (newValue == 'Hair Loss (හිසකෙස් නැතිවීම)') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const hairloss()),
                      );
                    } else if (newValue == 'Fever (උණ)') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const fever()),
                      );
                    } else if (newValue == 'Diarrhea (පාචනය)') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const diarrhea()),
                      );
                    } else if (newValue == 'Nausea (ඔක්කාරය)') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const nausea()),
                      );
                    }
                  },
                  items: diseaseList
                      .map<DropdownMenuItem<String>>((DiseasesModel value) {
                    return DropdownMenuItem<String>(
                      value: value.diseasesName,
                      child: Text(value.diseasesName),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                  height: 40), // Add space between select box and image
              Image.asset(
                'assets/sb1.png', // Adjust path accordingly
                height: 200, // Adjust the height of the image
                //fit: BoxFit.cover, // Adjust how the image is fitted
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(204, 89, 92, 89), // Start color
                      Color.fromARGB(204, 229, 234, 234), // End color
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      'Recognize the plant',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 244, 247, 244),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 50, // Set the desired width of the button
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PlantRecognitionPage()),
                          );
                          // Add functionality for button
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 1, 60,
                              7), // Change the background color of the button
                        ),
                        child: const Text(
                          'Click here',
                          style: TextStyle(
                            color: Colors
                                .white, // Change the color of the text inside the button
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class DiseasePage extends StatelessWidget {
  const DiseasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asthma'),
      ),
      body: const Center(
        child: Text('This is the Asthma page.'),
      ),
    );
  }
}
