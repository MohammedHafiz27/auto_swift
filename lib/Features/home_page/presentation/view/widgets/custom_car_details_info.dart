import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:auto_swift/Features/admin_page/data/models/car_model.dart';
import 'package:auto_swift/Features/home_page/presentation/view/widgets/car_details_row.dart';
import 'package:flutter/material.dart';

class CustomCarDetailsInfo extends StatelessWidget {
  const CustomCarDetailsInfo({super.key, required this.car});

  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(car.name, style: AppStyles.styleSemiBold22(context).copyWith(color: Colors.black)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(8)),
                child: Text(car.brand, style: AppStyles.styleSemiBold22(context).copyWith(color: Colors.white)),
              ),
            ],
          ),
          Text("Price: \$${car.price}", style: AppStyles.styleSemiBold22(context).copyWith(color: Colors.black)),
          Divider(indent: 16, endIndent: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CarDetailsRow(title: car.engine, icon: Icons.energy_savings_leaf_outlined),
              CarDetailsRow(title: "${car.speed} km/h", icon: Icons.speed),
              CarDetailsRow(title: car.seats, icon: Icons.chair_outlined),
            ],
          ),
        ],
      ),
    );
  }
}
