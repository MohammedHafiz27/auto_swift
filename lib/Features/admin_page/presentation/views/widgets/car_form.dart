import 'package:auto_swift/Core/car_brands.dart';
import 'package:auto_swift/Core/utils/custom_snack_bar.dart';
import 'package:auto_swift/Core/widgets/custom_text_field.dart';
import 'package:auto_swift/Features/admin_page/presentation/view_models/car_cubit/car_cubit.dart';
import 'package:auto_swift/Features/admin_page/presentation/view_models/car_cubit/car_state.dart';
import 'package:auto_swift/Features/admin_page/presentation/views/widgets/drob_down_button.dart';
import 'package:auto_swift/Features/admin_page/presentation/views/widgets/pick_image_widget.dart';
import 'package:auto_swift/Features/admin_page/presentation/views/widgets/row_text_field.dart';
import 'package:auto_swift/Features/admin_page/presentation/views/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocConsumer<CarCubit, CarState>(
      listener: (context, state) {
        if (state is CarSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar.build(message: 'Car added successfully', backgroundColor: Colors.green));
        } else if (state is CarFailure) {
          ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar.build(message: 'Failed: ${state.message}', backgroundColor: Colors.red));
        }
      },
      builder: (context, state) {
        return Column(
          spacing: 12,
          children: [
            CustomTextField(hintText: "Car Name", controller: _carNameController, keyboardType: TextInputType.text),
            CustomTextField(hintText: "Car Price", controller: _carPriceController, keyboardType: TextInputType.number),
            RowTextField(
              carEngineController: _carEngineController,
              carSpeedController: _carSpeedController,
              carSeatsController: _carSeatsController,
            ),
            CustomDrobDownButton(
              items: CarBrands.brands.map((brand) => DropdownMenuItem<String>(value: brand, child: Text(brand))).toList(),
              onChanged: (v) {
                setState(() {
                  selectedBrand = v as String?;
                });
              },
              value: selectedBrand,
              hint: 'Car brand',
              valid: 'Please select an option.',
            ),
            const PickImageWidget(),
            AbsorbPointer(
              absorbing: state is CarLoading,
              child: SubmitButton(
                carNameController: _carNameController,
                carPriceController: _carPriceController,
                carEngineController: _carEngineController,
                carSpeedController: _carSpeedController,
                carSeatsController: _carSeatsController,
                selectedBrand: selectedBrand,
                state: state,
              ),
            ),
          ],
        );
      },
    );
  }
}
