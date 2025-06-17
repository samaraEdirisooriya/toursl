class TouristCity {
  final String name;
  final String description;
  final String url;

  TouristCity({
    required this.name,
    required this.description,
    required this.url,
  });

  factory TouristCity.fromJson(Map<String, dynamic> json) {
    return TouristCity(
      name: json['name'],
      description: json['description'],
      url: json['url'],
    );
  }
}
