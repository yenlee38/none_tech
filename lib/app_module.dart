import 'package:flutter_modular/flutter_modular.dart';
import 'package:none_tech/presentation/page/auth/signin.dart';

class AppModule extends Module {

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child("/", child: (context) => const LoginScreen());
  }

}