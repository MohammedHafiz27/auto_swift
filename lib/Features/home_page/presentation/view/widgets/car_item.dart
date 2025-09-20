import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:auto_swift/Features/admin_page/data/models/car_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
          CachedNetworkImage(
            imageUrl: car.imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey.shade300,
              child: Center(child: CircularProgressIndicator(color: Colors.blueAccent)),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
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
                Text(car.name, style: AppStyles.styleSemiBold18(context).copyWith(color: Colors.black)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$${car.price}", style: AppStyles.styleSemiBold18(context).copyWith(color: Colors.black)),
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
