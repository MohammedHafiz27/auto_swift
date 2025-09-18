class CarModel {
  final String brand;
  final String name;
  final String price;
  final String engine;
  final String speed;
  final String seats;
  final String imageUrl;
  CarModel({
    required this.brand,
    required this.name,
    required this.price,
    required this.engine,
    required this.speed,
    required this.seats,
    required this.imageUrl,
  });

  factory CarModel.fromJson(json) {
    return CarModel(
      brand: json['brand'],
      name: json['name'],
      price: json['price'],
      engine: json['engine'],
      speed: json['speed'],
      seats: json['seats'],
      imageUrl: json['image'],
    );
  }
}
