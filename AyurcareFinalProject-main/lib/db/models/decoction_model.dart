class Remedy {
  final String url;
  final String disease;
  final String details;
  final String name;

  Remedy({
    required this.url,
    required this.disease,
    required this.details,
    required this.name,
  });

  // Factory method to create an instance of Remedy from a Firebase document snapshot
  factory Remedy.fromMap(Map<String, dynamic> data) {
    return Remedy(
      url: data['url'] ?? '',
      disease: data['disease'] ?? '',
      details: data['details'] ?? '',
      name: data['name'] ?? '',
    );
  }

  // Method to convert an instance of Remedy to a map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'disease': disease,
      'details': details,
      'name': name,
    };
  }
}
