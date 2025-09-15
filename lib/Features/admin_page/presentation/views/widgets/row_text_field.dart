import 'package:auto_swift/Core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RowTextField extends StatelessWidget {
  const RowTextField({
    super.key,
    required TextEditingController carEngineController,
    required TextEditingController carSpeedController,
    required TextEditingController carSeatsController,
  }) : _carEngineController = carEngineController,
       _carSpeedController = carSpeedController,
       _carSeatsController = carSeatsController;

  final TextEditingController _carEngineController;
  final TextEditingController _carSpeedController;
  final TextEditingController _carSeatsController;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Expanded(
          child: CustomTextField(
            hintText: "Car Engine",
            controller: _carEngineController,
            keyboardType: TextInputType.text,
          ),
        ),
        Expanded(
          child: CustomTextField(
            hintText: "Car Speed",
            controller: _carSpeedController,
            keyboardType: TextInputType.number,
          ),
        ),
        Expanded(
          child: CustomTextField(
            hintText: "Car Seats",
            controller: _carSeatsController,
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
