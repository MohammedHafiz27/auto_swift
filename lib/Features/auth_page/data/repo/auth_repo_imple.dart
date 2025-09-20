import 'package:auto_swift/Features/auth_page/data/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImple implements AuthRepo {
  final FirebaseAuth firebaseAuth;

  AuthRepoImple({required this.firebaseAuth});
  @override
  Future<String> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return firebaseAuth.currentUser!.email!;
    } catch (e) {
      return Future.error('Failed to sign in: ${e.toString()}');
    }
  }

  @override
  Future<void> signUpWithEmailAndPassword({required String email, required String password}) async {
    await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }
}
