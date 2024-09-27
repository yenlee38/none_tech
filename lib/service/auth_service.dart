import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final AuthService _authService = AuthService._internal();
  static final FirebaseAuth auth = FirebaseAuth.instance;

  factory AuthService() {
    return _authService;
  }

  AuthService._internal();

  static Future<User?> createUser({
    required String email,
    required String password,
  }) async {
    final credential = await auth.createUserWithEmailAndPassword(email: email, password: password);
    return credential.user;
  }

  static Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final credential = await auth.signInWithEmailAndPassword(email: email, password: password);
    return credential.user;
  }

}
