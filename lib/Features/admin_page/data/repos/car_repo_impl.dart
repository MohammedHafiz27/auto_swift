import 'dart:io';
import 'package:auto_swift/Features/admin_page/data/models/car_model.dart';
import 'package:auto_swift/Features/admin_page/data/repos/car_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class CarRepoImpl implements CarRepo {
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;
  final ImagePicker picker;

  CarRepoImpl({required this.firestore, required this.storage, required this.picker});

  @override
  Future<String> uploadCarImage() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked == null) throw Exception("No image selected");

    final file = File(picked.path);
    final ref = storage.ref('cars/${DateTime.now()}.jpg');
    await ref.putFile(file);
    return await ref.getDownloadURL();
  }

  @override
  Future<void> addCar({required CarModel carModel}) async {
    await firestore.collection("cars").add({
      "name": carModel.name,
      "price": carModel.price,
      "engine": carModel.engine,
      "speed": carModel.speed,
      "seats": carModel.seats,
      "brand": carModel.brand,
      "image": carModel.imageUrl,
      "createdAt": DateTime.now(),
    });
  }
}
