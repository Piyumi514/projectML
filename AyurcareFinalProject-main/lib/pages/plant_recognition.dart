import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'dart:io';

class PlantRecognitionPage extends StatefulWidget {
  const PlantRecognitionPage({super.key});

  @override
  _PlantRecognitionPageState createState() => _PlantRecognitionPageState();
}

class _PlantRecognitionPageState extends State<PlantRecognitionPage> {
  String? _predictionResult;

  @override
  void initState() {
    super.initState();
    _loadModel();
  }

  Future<void> _loadModel() async {
    try {
      String? res = await Tflite.loadModel(
        model: "assets/leaf_classification_model.tflite",
        labels: "assets/labels.txt",
      );
      print("Model loaded: $res");
    } catch (e) {
      print("Failed to load model: $e");
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      print('Image path: ${image.path}');
      await _predictImage(image.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> _predictImage(String imagePath) async {
    try {
      var output = await Tflite.runModelOnImage(
        path: imagePath,
        numResults: 5,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5,
      );

      if (output != null && output.isNotEmpty) {
        setState(() {
          _predictionResult = output.first['label'];
        });
      } else {
        setState(() {
          _predictionResult = 'Unable to classify the image';
        });
      }
    } catch (e) {
      print("Error during prediction: $e");
      setState(() {
        _predictionResult = 'Error during prediction: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
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
                  Color.fromARGB(255, 19, 48, 20),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/bg.jpg',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const Text(
            'Recognize the plant',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 2, 163, 56)),
          ),
          if (_predictionResult != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Prediction: $_predictionResult',
                style: const TextStyle(fontSize: 18, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.grey.withOpacity(0.2),
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.description,
                            size: 40,
                            color: Color.fromARGB(255, 2, 82, 35),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            _pickImage(ImageSource.gallery);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color.fromARGB(255, 4, 79, 7),
                          ),
                          child: const Text('Choose a photo'),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.grey.withOpacity(0.2),
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 40,
                            color: Color.fromARGB(255, 2, 82, 35),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            _pickImage(ImageSource.camera);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color.fromARGB(255, 4, 79, 7),
                          ),
                          child: const Text('Take a photo'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: PlantRecognitionPage(),
  ));
}
