import 'package:auto_swift/Core/helper/cache_helper.dart';
import 'package:auto_swift/Core/helper/cache_helper_key.dart';
import 'package:auto_swift/Features/auth_page/data/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial()) {
    isLoggedIn();
  }
  final AuthRepo authRepo;
  String? role;
  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      role = await authRepo.signInWithEmailAndPassword(email: email, password: password);
      emit(AuthSuccess());
      CacheHelper.saveData(key: CacheHelperKey.isLoggedIn, value: true);
      CacheHelper.saveData(key: CacheHelperKey.role, value: role);
    } catch (e) {
      emit(AuthFailure(e.toString()));
      CacheHelper.saveData(key: CacheHelperKey.isLoggedIn, value: false);
    }
  }

  Future<void> signUpWithEmailAndPassword({required String email, required String password}) async {
    try {
      emit(AuthLoadingSignup());
      await authRepo.signUpWithEmailAndPassword(email: email, password: password);
      emit(AuthSuccessSignup());
    } catch (e) {
      emit(AuthFailureSignup(e.toString()));
    }
  }

  Future<void> signOut() async {
    await CacheHelper.removeData(key: CacheHelperKey.isLoggedIn);
    await CacheHelper.removeData(key: CacheHelperKey.role);
    emit(AuthInitial());
  }

  Future<void> isLoggedIn() async {
    final isLoggedIn = CacheHelper.getData(key: CacheHelperKey.isLoggedIn);

    if (isLoggedIn == true) {
      role = CacheHelper.getData(key: CacheHelperKey.role);
      emit(AuthSuccess());
    } else {
      emit(AuthInitial());
    }
  }
}
