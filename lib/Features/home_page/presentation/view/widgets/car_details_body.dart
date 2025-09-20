import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:auto_swift/Features/admin_page/data/models/car_model.dart';
import 'package:flutter/material.dart';

class CarDetailsBody extends StatelessWidget {
  const CarDetailsBody({super.key, required this.car});

  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(car.imageUrl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Car Name: ${car.name}", style: AppStyles.styleSemiBold22(context)),
              Text("Price: \$${car.price}", style: AppStyles.styleSemiBold22(context)),
              Text("Brand: ${car.brand}", style: AppStyles.styleSemiBold22(context)),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Engine: ${car.engine}", style: AppStyles.styleSemiBold18(context)),
                  Text("Speed: ${car.speed}", style: AppStyles.styleSemiBold18(context)),
                  Text("Seats: ${car.seats}", style: AppStyles.styleSemiBold18(context)),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: 8),
                    Text("Book Now", style: AppStyles.styleSemiBold18(context).copyWith(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
