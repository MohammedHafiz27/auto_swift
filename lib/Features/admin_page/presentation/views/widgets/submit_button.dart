
import 'package:auto_swift/Features/admin_page/presentation/view_models/car_cubit/car_cubit.dart';
import 'package:auto_swift/Features/admin_page/presentation/view_models/car_cubit/car_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitButton extends StatelessWidget {
  final CarState state;
  const SubmitButton({
    super.key,
    required TextEditingController carNameController,
    required TextEditingController carPriceController,
    required TextEditingController carEngineController,
    required TextEditingController carSpeedController,
    required TextEditingController carSeatsController,
    required this.selectedBrand, required this.state,
  }) : _carNameController = carNameController,
       _carPriceController = carPriceController,
       _carEngineController = carEngineController,
       _carSpeedController = carSpeedController,
       _carSeatsController = carSeatsController;

  final TextEditingController _carNameController;
  final TextEditingController _carPriceController;
  final TextEditingController _carEngineController;
  final TextEditingController _carSpeedController;
  final TextEditingController _carSeatsController;
  final String? selectedBrand;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {
        context.read<CarCubit>().submitCar(
          name: _carNameController.text,
          price: _carPriceController.text,
          engine: _carEngineController.text,
          speed: _carSpeedController.text,
          seats: _carSeatsController.text,
          brand: selectedBrand ?? '',
        );
      },
      child: state is CarLoading
          ? const SizedBox(height: 24, width: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
          : const Text("Submit"),
    );
  }
}
