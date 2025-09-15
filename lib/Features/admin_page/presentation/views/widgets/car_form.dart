import 'package:auto_swift/Core/widgets/custom_text_field.dart';
import 'package:auto_swift/Features/admin_page/presentation/views/widgets/drob_down_button.dart';
import 'package:flutter/material.dart';

class CarForm extends StatefulWidget {
  const CarForm({super.key});

  @override
  State<CarForm> createState() => _CarFormState();
}

class _CarFormState extends State<CarForm> {
  final TextEditingController _carNameController = TextEditingController();
  final TextEditingController _carPriceController = TextEditingController();
  final TextEditingController _carEngineController = TextEditingController();
  final TextEditingController _carSpeedController = TextEditingController();
  final TextEditingController _carSeatsController = TextEditingController();

  List<String> brands = ['BMW', 'Audi', 'Mercedes'];
  String? selectedBrand;
  @override
  void dispose() {
    _carNameController.dispose();
    _carEngineController.dispose();
    _carPriceController.dispose();
    _carSeatsController.dispose();
    _carSpeedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        CustomTextField(hintText: "Car Name", controller: _carNameController, keyboardType: TextInputType.text),
        CustomTextField(hintText: "Car Price", controller: _carPriceController, keyboardType: TextInputType.number),
        Row(
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
        ),
        CustomDrobDownButton(
          items: brands.map((brand) => DropdownMenuItem<String>(value: brand, child: Text(brand))).toList(),
          onChanged: (v) {
            setState(() {
              selectedBrand = v as String?;
            });
          },
          value: selectedBrand,
          hint: 'Car brand',
          valid: 'Please select an option.',
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 48),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () {},
          child: Text("Add Car"),
        ),
      ],
    );
  }
}
