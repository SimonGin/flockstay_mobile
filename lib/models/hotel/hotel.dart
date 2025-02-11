import 'dart:convert';

class Hotel {
  final int id;
  final String createdAt;
  final String updatedAt;
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
    required this.createdAt,
    required this.updatedAt,
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
      id: json['ID'],
      createdAt: json['CreatedAt'],
      updatedAt: json['UpdatedAt'],
      deletedAt: json['DeletedAt'],
      name: json['name'],
      city: json['city'],
      address: json['address'],
      description: json['description'],
      rating: double.parse(json['rating'].toString()),
      images: List<String>.from(jsonDecode(json['images'])),
      checkInTime: json['check_in_time'],
      checkOutTime: json['check_out_time'],
    );
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

  static List<Hotel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Hotel.fromJson(json)).toList();
  }
}
