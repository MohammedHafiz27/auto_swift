import 'package:auto_swift/Core/car_brands.dart';
import 'package:auto_swift/Features/admin_page/data/models/car_model.dart';
import 'package:auto_swift/Features/home_page/data/repo/cars_repository_imple.dart';
import 'package:auto_swift/Features/home_page/presentation/view/widgets/brand_item_list_view.dart';
import 'package:auto_swift/Features/home_page/presentation/view/widgets/car_item.dart';
import 'package:flutter/material.dart';

class CarItemGridView extends StatefulWidget {
  const CarItemGridView({super.key});

  @override
  State<CarItemGridView> createState() => _CarItemGridViewState();
}

class _CarItemGridViewState extends State<CarItemGridView> {
  String? selectedBrand;
  @override
  Widget build(BuildContext context) {
    final repo = CarsRepositoryImple();

    return Column(
      spacing: 12,
      children: [
        BrandItemListView(
          brands: CarBrands.brands.contains("all") ? CarBrands.brands : ["all", ...CarBrands.brands],
          brandName: selectedBrand ?? '',
          onBrandSelected: (brand) {
            setState(() {
              selectedBrand = brand;
            });
          },
          isSelected: CarBrands.brands.indexOf(selectedBrand ?? 'all') + 1,
        ),
        Expanded(
          child: StreamBuilder<List<CarModel>>(
            stream: selectedBrand == null || selectedBrand!.isEmpty || selectedBrand == "all"
                ? repo.fetchCarsOnce()
                : repo.fetchCarsByBrand(selectedBrand!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator.adaptive());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("No cars found"));
              }
              final cars = snapshot.data!;
              return GridView.builder(
                itemCount: cars.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 1 / 1.5,
                  maxCrossAxisExtent: 300,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 3,
                ),
                itemBuilder: (context, index) {
                  return CarItem(car: cars[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
