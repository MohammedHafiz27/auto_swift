import 'package:auto_swift/Features/admin_page/data/models/car_model.dart';
import 'package:auto_swift/Features/home_page/data/repo/cars_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarsRepositoryImple implements CarsRepository {
  final _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<CarModel>> fetchCarsOnce() {
    return _firestore
        .collection('cars')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => CarModel.fromJson(doc.data())).toList());
  }
}
