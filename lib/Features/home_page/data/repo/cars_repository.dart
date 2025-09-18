import 'package:auto_swift/Features/admin_page/data/models/car_model.dart';

abstract class CarsRepository {
  Stream<List<CarModel>> fetchCarsOnce();
}
