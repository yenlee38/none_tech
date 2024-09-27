import 'package:flutter/material.dart';
import '../../../service/auth_service.dart';
import '../../../widget/export.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> login() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    try {
      final credential = await AuthService.signInWithEmailAndPassword(email: email, password: password).catchError((e) => print("errrooo $e"));
      if (credential != null) {
        print("Login success");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     body: SafeArea(
  //       child: Stack(
  //         children: [
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.end,
  //             mainAxisSize: MainAxisSize.max,
  //             children: [
  //               const Image(
  //                 image: AssetImage('assets/images/login_art.png'),
  //                 height: 350,
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 16),
  //                 child: CustomTextFormFieldWidget(
  //                   labelText: "Email address",
  //                   controller: _emailController,
  //                   key: const Key("emailText"),
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 64,
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 16),
  //                 child: CustomTextFormFieldWidget(
  //                   labelText: "Password",
  //                   controller: _passwordController,
  //                   key: const Key("passwordText"),
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 64,
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 24),
  //                 child: CustomButtonWidget(
  //                   title: "Login",
  //                   onTap: login,
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 64,
  //               ),
  //               const Spacer(),
  //             ],
  //           ),
  //           const Positioned(
  //             top: 0,
  //             child: Column(
  //               children: [
  //                 Text("Hello, Wellcome Back"),
  //                 Text("Hello, Wellcome Back"),
  //                 Text("Hello, Wellcome Back"),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Image(
          image: AssetImage('assets/images/login_art.png'),
          height: 350,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomTextFormFieldWidget(
            labelText: "Email address",
            controller: _emailController,
            key: const Key("emailText"),
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomTextFormFieldWidget(
            labelText: "Password",
            controller: _passwordController,
            key: const Key("passwordText"),
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomButtonWidget(
            title: "Login",
            onTap: login,
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        const Spacer(),
      ],
    );
  }
  }
