// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:none_tech/main.dart';
import 'package:none_tech/presentation/page/auth/signin.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets("Login app test", (tester) async {
    await tester.pumpAndSettle();
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    final emailField = find.byKey(const Key("emailText"));
    final passwordField = find.byKey(const Key("passwordText"));
    final loginButton = find.text("Login");

    expect(emailField, findsOneWidget);
    expect(passwordField, findsOneWidget);
    expect(loginButton, findsOneWidget);

    await tester.enterText(emailField, "ngocyen174308@gmail.com");
    await tester.enterText(passwordField, "18110402yen");

    await tester.pump();
  });
}
