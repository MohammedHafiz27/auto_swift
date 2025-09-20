import 'package:auto_swift/Features/auth_page/data/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;
  String? role;
  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      role = await authRepo.signInWithEmailAndPassword(email: email, password: password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
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
}
