import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:auto_swift/Features/admin_page/presentation/view_models/car_cubit/car_cubit.dart';
import 'package:auto_swift/Features/admin_page/presentation/view_models/car_cubit/car_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: BlocBuilder<CarCubit, CarState>(
        builder: (context, state) {
          if (state is CarImageLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CarImagePicked) {
            return TextButton.icon(
              onPressed: null,
              icon: const Icon(Icons.check, color: Colors.green),
              label: const Text("Image Selected"),
            );
          } else if (state is CarImageError) {
            return TextButton.icon(
              onPressed: () => context.read<CarCubit>().pickImage(),
              icon: const Icon(Icons.image, color: Colors.red),
              label: const Text("Retry Image"),
            );
          } else {
            return TextButton.icon(
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.brightnessOf(context) == Brightness.dark ? Colors.white : Colors.black,
              ),
              onPressed: () => context.read<CarCubit>().pickImage(),
              icon: Icon(
                Icons.image,
                color: Theme.brightnessOf(context) == Brightness.dark ? Colors.white : Colors.black,
              ),
              label: Text("Pick Image", style: AppStyles.styleRegular16(context)),
            );
          }
        },
      ),
    );
  }
}
