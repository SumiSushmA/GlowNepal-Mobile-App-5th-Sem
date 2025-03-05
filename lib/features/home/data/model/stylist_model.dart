import 'package:hive/hive.dart';

part 'stylist_model.g.dart'; // Ensure this file is generated

@HiveType(typeId: 1)
class StylistModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String speciality; // Updated field name

  @HiveField(3)
  final String image;

  @HiveField(4)
  final String experience;

  @HiveField(5)
  final double bookingFee;

  @HiveField(6)
  final bool available;

  @HiveField(7)
  final String about;

  StylistModel({
    required this.id,
    required this.name,
    required this.speciality, // Updated field name
    required this.image,
    required this.experience,
    required this.bookingFee,
    required this.available,
    required this.about,
  });

  /// Convert JSON to StylistModel
  factory StylistModel.fromJson(Map<String, dynamic> json) {
    return StylistModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? 'Unknown Stylist',
      speciality: json['speciality'] ?? 'General', // Fix: Ensure correct key
      image: json['image'] ?? 'https://via.placeholder.com/150',
      experience: json['experience'] ?? 'Not available',
      bookingFee: (json['fees'] as num?)?.toDouble() ?? 0.0, // Fix: Corrected Key
      available: json['available'] ?? false,
      about: json['about'] ?? 'No description available',
    );
  }

  /// Convert StylistModel to JSON
  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "speciality": speciality, // Fix: Ensure correct key
      "image": image,
      "experience": experience,
      "fees": bookingFee, // Fix: Ensure correct key for backend
      "available": available,
      "about": about,
    };
  }
}
