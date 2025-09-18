import 'package:auto_swift/Features/admin_page/data/models/car_model.dart';
import 'package:auto_swift/Features/home_page/data/repo/cars_repository_imple.dart';
import 'package:auto_swift/Features/home_page/presentation/view/widgets/car_item.dart';
import 'package:flutter/material.dart';

class CarItemGridView extends StatelessWidget {
  const CarItemGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CarModel>>(
      stream: CarsRepositoryImple().fetchCarsOnce(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator.adaptive();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final cars = snapshot.data as List<dynamic>;
          return GridView.builder(
            itemCount: cars.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 1 / 1.5,
              maxCrossAxisExtent: 300,
              mainAxisSpacing: 5,
              crossAxisSpacing: 3,
            ),
            itemBuilder: (context, index) {
              return CarItem(car: cars[index]);
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
