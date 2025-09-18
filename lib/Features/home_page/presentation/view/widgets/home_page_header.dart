
import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
            "https://cdn.prod.website-files.com/5e9033e54576bc13f0b47167/61d64e78e9f7444162abcbef_image2-min.png",
          ),
        ),
        Text("Boston , New York", style: AppStyles.styleSemiBold14(context)),
        Icon(CupertinoIcons.circle_grid_3x3_fill, size: 28),
      ],
    );
  }
}
