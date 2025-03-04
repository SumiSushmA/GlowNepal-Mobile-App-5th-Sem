import 'package:hive/hive.dart';

part 'stylist_model.g.dart'; // Ensure this file is generated

@HiveType(typeId: 1)
class StylistModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String category;

  @HiveField(3)
  final String image;

  @HiveField(4)
  final String experience;

  @HiveField(5)
  final double bookingFee;

  @HiveField(6)
  final bool available;

  @HiveField(7)
  final String about; // Add this field

  StylistModel({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.experience,
    required this.bookingFee,
    required this.available,
    required this.about, // Add this field
  });

  factory StylistModel.fromJson(Map<String, dynamic> json) {
    return StylistModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? 'Unknown Stylist',
      category: json['category'] ?? 'General',
      image: json['image'] ?? 'https://via.placeholder.com/150',
      experience: json['experience'] ?? 'Not available',
      bookingFee: (json['booking_fee'] as num?)?.toDouble() ?? 0.0,
      available: json['available'] ?? false,
      about: json['about'] ??
          'No description available', // Ensure this field exists
    );
  }
}
