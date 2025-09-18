import 'package:auto_swift/Features/admin_page/data/models/car_model.dart';

abstract class CarRepo {
  Future<String> uploadCarImage(); 
  Future<void> addCar({
required CarModel carModel,
  });
}
