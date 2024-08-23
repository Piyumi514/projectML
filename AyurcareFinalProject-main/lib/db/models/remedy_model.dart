import 'package:cloud_firestore/cloud_firestore.dart';

class DiseasesModel {
  final String diseasesName;

  DiseasesModel({
    required this.diseasesName,
  });

  factory DiseasesModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return DiseasesModel(
        diseasesName: data['diseases_name'] ?? ''
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'diseases_name': diseasesName,
    };
  }
}