class City {
  final int id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String name;
  final String image;
  final int hotelNum;

  City({
    required this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    required this.name,
    required this.image,
    required this.hotelNum,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'] ?? 0,
      createdAt: json['CreatedAt'],
      updatedAt: json['UpdatedAt'],
      deletedAt: json['DeletedAt'],
      name: json['name'] ?? "Unknown",
      image: json['image'] ??
          "https://wallpapercat.com/w/full/6/8/1/294088-2048x1319-desktop-hd-los-angeles-background.jpg",
      hotelNum: json['hotel_count'] ?? 0,
    );
  }

  static List<City> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => City.fromJson(json)).toList();
  }
}
