import 'dart:convert';

class Hotel {
  final int id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String name;
  final String city;
  final String address;
  final String description;
  final double rating;
  final List<String> images;
  final String checkInTime;
  final String checkOutTime;

  Hotel({
    required this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    required this.name,
    required this.city,
    required this.address,
    required this.description,
    required this.rating,
    required this.images,
    required this.checkInTime,
    required this.checkOutTime,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'] ?? 0, // Fix: Ensure id is correctly parsed
      createdAt: json['CreatedAt'], // Might be null
      updatedAt: json['UpdatedAt'], // Might be null
      deletedAt: json['DeletedAt'], // Might be null
      name: json['name'] ?? "Unknown",
      city: json['city'] ?? "Unknown",
      address: json['address'] ?? "Unknown",
      description: json['description'] ?? "No description available",
      rating: (json['rating'] != null)
          ? double.tryParse(json['rating'].toString()) ?? 0.0
          : 0.0,
      images: List<String>.from(jsonDecode(json['images'])),
      checkInTime: json['check_in_time'],
      checkOutTime: json['check_out_time'],
    );
  }

  static List<Hotel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Hotel.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'CreatedAt': createdAt,
      'UpdatedAt': updatedAt,
      'DeletedAt': deletedAt,
      'name': name,
      'city': city,
      'address': address,
      'description': description,
      'rating': rating.toString(),
      'images': jsonEncode(images),
      'check_in_time': checkInTime,
      'check_out_time': checkOutTime,
    };
  }
}
