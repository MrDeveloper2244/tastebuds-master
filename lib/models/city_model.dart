class CityModel {
  final String name;
  final String code;

  CityModel({required this.name, required this.code});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      name: json['name'],
      code: json['id'].toString(),
    );
  }

  @override
  String toString() => name;
}
