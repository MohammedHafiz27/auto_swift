
import 'package:auto_swift/Features/home_page/presentation/view/widgets/brand_item.dart';
import 'package:flutter/material.dart';

class BrandItemListView extends StatelessWidget {
  const BrandItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (context, index) {
          return Padding(padding: const EdgeInsets.symmetric(horizontal: 2), child: BrandItem());
        },
      ),
    );
  }
}
