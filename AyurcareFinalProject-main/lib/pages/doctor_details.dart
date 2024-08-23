// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:animate_do/animate_do.dart';
import 'package:ayurcare/diseases/disease_page.dart';
import 'package:ayurcare/pages/home_page/home_page_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DoctorPage(exportData: null),
      ),
    );

class DoctorPage extends StatefulWidget {
  final dynamic exportData;

  const DoctorPage({super.key, required this.exportData});

  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  String? selectedDistrict;
  final Map<String, Map<String, String>> doctorDetails = {
    'Ampara': {
      'name': 'Dr. Isuru Liyanage',
      'specialization': 'General Physician',
      'medicalCentre': 'Ayurvedic Research Hospital',
      'address': 'Ayurvedic Research Hospital,Ampara',
      'contact': '0632224349'
    },
    'Anuradhapura': {
      'name': 'Dr. Thilini Perera',
      'specialization': 'General Physician',
      'medicalCentre': 'Ayurweda Medical Center',
      'address': '309, devana piyawara, Thambuttegama',
      'contact': '0718855940'
    },
    'Badulla': {
      'name': 'Dr. Gayathri Madumani',
      'specialization': 'General Physician',
      'medicalCentre': 'Gampaha Ayurweda Medical Center',
      'address': 'Haldummulla, Haputale, Sri Lanka',
      'contact': '0704041699'
    },
    'Batticaloa': {
      'name': 'Dr.Thusya Yathies',
      'specialization': 'General Physician',
      'medicalCentre': 'Borella ayurvedic Hospital',
      'address': 'Borella ayurvedic hospital,Batticaloa',
      'contact': '065 2222678'
    },
    'Colombo': {
      'name': 'Dr K A D Keeshani Randima',
      'specialization': 'General Physician',
      'medicalCentre': 'Ayurdhara Ayurwedic Medical Center',
      'address': 'No. 102G Bangalawata, Kothalawala, Kaduwela',
      'contact': '0771383439'
    },
    'Galle': {
      'name': 'Dr. Oshini Siriwardhana',
      'specialization': 'General Physician',
      'medicalCentre': '',
      'address': '86/2 Wakwella rd, Galle',
      'contact': '0778634089'
    },
    'Gampaha': {
      'name': 'Dr R. M. D Sasrika',
      'specialization': 'General Physician',
      'medicalCentre': 'Seth AYU Medical Center',
      'address': '247/1, Pahala Karagahamuna, Kadawatha',
      'contact': '0773756563'
    },
    'Hambantota': {
      'name': 'Dr.Athma Karunathilaka',
      'specialization': 'General Physician',
      'medicalCentre': 'Ayurvedic Research Hospital',
      'address': 'Siribopura, Hambantota',
      'contact': '047-2256700'
    },
    'Jaffna': {
      'name': 'Dr.(Mrs).S.Thurairatnam',
      'specialization': 'General Physician',
      'medicalCentre': 'Siddha Teaching Hospital',
      'address': 'Kaithady,Kandy Road',
      'contact': '0212057104'
    },
    'Kalutara': {
      'name': 'Dr. Chamari Adihetti',
      'specialization': 'General Physician',
      'medicalCentre': 'Ayurwedic Medical Center',
      'address': '247/1, Pahala Karagahamuna, Kadawatha',
      'contact': '0712393687'
    },
    'Kandy': {
      'name': 'Dr. Harshana Dissanayake',
      'specialization': 'General Physician',
      'medicalCentre': 'Jeewaka Ayurweda',
      'address': 'Kandy Road, Hasalaka',
      'contact': '0714541705'
    },
    'Kegalle': {
      'name': 'Dr. Hansani Wimalasena',
      'specialization': 'General Physician',
      'medicalCentre': 'Ayushveda - Ayurweda & Wellness',
      'address': 'No. 37, Kandy road, Kegalle',
      'contact': '0774166864'
    },
    'Kilinochchi': {
      'name': 'Dr. P.Karunja ',
      'specialization': 'General Physician',
      'medicalCentre': 'HDU, DGH Chilaw',
      'address': 'RDHS Division , Kilinochchi',
      'contact': '0718561596'
    },
    'Kurunegala': {
      'name': 'Dr. Udith',
      'specialization': 'General Physician',
      'medicalCentre': 'Ayurwedic Medical Center',
      'address': 'Kurunegala, Pothuhera',
      'contact': '0772656131'
    },
    'Mannar': {
      'name': 'Dr. Thiyananthan Thinesh',
      'specialization': 'General Physician',
      'medicalCentre': 'SURYA Ayurveda Hospital & YOGA Centre',
      'address': 'SURYA Ayurveda Hospital, Mannar',
      'contact': '076 731 5797'
    },
    'Matale': {
      'name': 'Dr. Dimitri Darshika',
      'specialization': 'General Physician',
      'medicalCentre': 'Deegayush Ayurweda Medical Center',
      'address': 'No. 15 Rose Street, Matale',
      'contact': '0763925388'
    },
    'Matara': {
      'name': 'M.D.M Warnathilaka',
      'specialization': 'General Physician',
      'medicalCentre': 'Sakya Traditional Ayuruwedic Hospital',
      'address': 'No:678, Matara 81000',
      'contact': '0412 244 833'
    },
    'Moneragala': {
      'name': 'Dr. Indika Nuwan',
      'specialization': 'General Physician',
      'medicalCentre': 'Gampaha Ayurweda Medical Center',
      'address': 'Haputale Road, Wallawaya',
      'contact': '0719178775'
    },
    'Nuwara Eliya': {
      'name': 'Dr. Tharanga Weerathunga',
      'specialization': 'General Physician',
      'medicalCentre': 'Thilaka Treatement Ayurveda Center',
      'address': 'No.22 Lady Mc Cullum s Drive, Lady McClums Dr',
      'contact': '071 084 7522'
    },
    'Polonnaruwa': {
      'name': 'Dr. W.S.D. Sooriya bandara',
      'specialization': 'General Physician',
      'medicalCentre': 'Rural Ayurveda Hospital',
      'address': 'Rural Ayurveda Hospital, Siripura',
      'contact': '00272-0537'
    },
    'Puttalam': {
      'name': 'Dr. N M U Madhubhashini',
      'specialization': 'General Physician',
      'medicalCentre': 'Sukayu Ayurweda Medical Center',
      'address': 'Newtown, Madampe',
      'contact': '0710647771'
    },
    'Ratnapura': {
      'name': 'Dr. D G N Awanthi',
      'specialization': 'General Physician',
      'medicalCentre': 'Sumethma Ayurwedic Medical Center',
      'address': 'Thelwatte, Mudduwa, Rathnapura',
      'contact': '0773572530'
    },
    'Trincomalee': {
      'name': 'Dr. Chamil Karunarathna',
      'specialization': 'General Physician',
      'medicalCentre': 'Trinco Ayurweda Clinic',
      'address': 'Kandy road, Trincomalee',
      'contact': '0713784039'
    },
    'Vavuniya': {
      'name': 'Dr. Thambippillai Krishnapahavan',
      'specialization': 'General Physician',
      'medicalCentre': 'Krishna Siddha Ayurveda Vaidyasalai',
      'address': 'no-11,3rd cross street,Kandy road',
      'contact': '071 210 2913'
    },
  };

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const disease()),
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 30),
            SizedBox(
              height: 250,
              child: Stack(
                children: <Widget>[
                  Center(
                    // Center widget added
                    child: Positioned(
                      height: 400,
                      width: width,
                      child: FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/doctor.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(
                    duration: const Duration(milliseconds: 1500),
                    child: const Text(
                      "Doctor Details",
                      style: TextStyle(
                        color: Color.fromRGBO(15, 134, 39, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1700),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          color: const Color.fromRGBO(196, 135, 198, .3),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(196, 135, 198, .3),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: DropdownButton<String>(
                        value: selectedDistrict,
                        hint: const Text("Select District"),
                        isExpanded: true,
                        items: doctorDetails.keys.map((String district) {
                          return DropdownMenuItem<String>(
                            value: district,
                            child: Text(district),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedDistrict = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  selectedDistrict != null
                      ? FadeInUp(
                          duration: const Duration(milliseconds: 1700),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(
                                color: const Color.fromRGBO(196, 135, 198, .3),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(196, 135, 198, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                _buildTextField(
                                  "Doctor Name",
                                  doctorDetails[selectedDistrict]!['name']!,
                                ),
                                _buildTextField(
                                  "Specialization",
                                  doctorDetails[selectedDistrict]![
                                      'specialization']!,
                                ),
                                _buildTextField(
                                  "Medical Centre",
                                  doctorDetails[selectedDistrict]![
                                      'medicalCentre']!,
                                ),
                                _buildTextField(
                                  "Address",
                                  doctorDetails[selectedDistrict]!['address']!,
                                ),
                                _buildTextField(
                                  "Contact Info",
                                  doctorDetails[selectedDistrict]!['contact']!,
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 20),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1700),
                    child: const Center(
                      child: Text(
                        "Connect your districtial doctor",
                        style: TextStyle(color: Color.fromRGBO(16, 144, 35, 1)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1900),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      color: const Color.fromRGBO(3, 70, 36, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 50,
                      child: const Center(
                        child: Text(
                          "Home",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color.fromRGBO(196, 135, 198, .3)),
        ),
      ),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: TextStyle(
                color: Colors.grey.shade700, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }
}
