import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:auto_swift/Features/admin_page/data/models/car_model.dart';
import 'package:flutter/material.dart';

class CarItem extends StatelessWidget {
  const CarItem({super.key, required this.car});
  final CarModel car;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "https://img.freepik.com/free-psd/modern-car-isolated_23-2151504562.jpg?semt=ais_incoming&w=740&q=80",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  car.brand,
                  style: AppStyles.styleRegular16(
                    context,
                  ).copyWith(color: Colors.blueAccent, fontWeight: FontWeight.w500),
                ),
                Text(car.name, style: AppStyles.styleSemiBold18(context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$${car.price}", style: AppStyles.styleSemiBold18(context)),
                    Icon(Icons.arrow_circle_right_rounded, color: Colors.blueAccent),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
