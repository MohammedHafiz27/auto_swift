import 'package:auto_swift/Features/admin_page/data/models/car_model.dart';
import 'package:auto_swift/Features/home_page/presentation/view/widgets/car_details_body.dart';
import 'package:flutter/material.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({super.key, required this.car});
  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(top: true, child: CarDetailsBody(car: car)),
    );
  }
}
