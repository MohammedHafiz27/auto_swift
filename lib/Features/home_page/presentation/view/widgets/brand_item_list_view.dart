import 'package:auto_swift/Features/home_page/presentation/view/widgets/brand_item.dart';
import 'package:flutter/material.dart';

class BrandItemListView extends StatelessWidget {
  const BrandItemListView({
    super.key,
    required this.onBrandSelected,
    required this.brandName,
    required this.brands,
    required this.isSelected,
  });
  final String brandName;
  final List<String> brands;
  final int isSelected;
  final Function(String brandName) onBrandSelected;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: BrandItem(
              brandName: brands[index],
              onTap: () => onBrandSelected(brands[index]),
              isSelected: isSelected == index,
            ),
          );
        },
      ),
    );
  }
}
