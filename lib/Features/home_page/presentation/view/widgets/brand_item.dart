import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class BrandItem extends StatelessWidget {
  final String brandName;
  final void Function()? onTap;
  const BrandItem({super.key, required this.brandName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      
        child: Text(brandName, style: AppStyles.styleRegular14(context).copyWith(color: Colors.white)),
      ),
    );
  }
}
