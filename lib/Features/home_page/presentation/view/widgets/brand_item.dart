
import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
    
      child: Text("BMW", style: AppStyles.styleRegular14(context).copyWith(color: Colors.white)),
    );
  }
}
