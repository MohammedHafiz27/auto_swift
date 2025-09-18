import 'package:auto_swift/Features/admin_page/data/models/car_model.dart';
import 'package:auto_swift/Features/admin_page/data/repos/car_repo.dart';
import 'package:auto_swift/Features/admin_page/presentation/view_models/car_cubit/car_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarCubit extends Cubit<CarState> {
  final CarRepo carRepo;
  String? imageUrl;

  CarCubit(this.carRepo) : super(CarInitial());

  Future<void> pickImage() async {
    try {
      emit(CarImageLoading());
      imageUrl = await carRepo.uploadCarImage();
      emit(CarImagePicked(imageUrl!));
    } catch (e) {
      emit(CarImageError(e.toString()));
    }
  }

  Future<void> submitCar({required CarModel carModel,
  }) async {
    try {
      if (imageUrl == null) throw Exception("Please pick an image first");
      emit(CarLoading());
      await carRepo.addCar(
        carModel: carModel
      );

      emit(CarSuccess());
    } catch (e) {
      emit(CarFailure(e.toString()));
    }
  }
}
