abstract class AuthRepo {
  Future<String> signInWithEmailAndPassword({required String email, required String password});
  Future<void> signUpWithEmailAndPassword({required String email, required String password});
}
