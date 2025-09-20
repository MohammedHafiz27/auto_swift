import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:auto_swift/Features/admin_page/data/models/car_model.dart';
import 'package:auto_swift/Features/home_page/presentation/view/widgets/custom_car_details_info.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
        AspectRatio(
          aspectRatio: 16 / 9,
          child: CachedNetworkImage(
            imageUrl: car.imageUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(color: Colors.grey[300]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              CustomCarDetailsInfo(car: car),
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
