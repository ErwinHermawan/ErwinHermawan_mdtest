import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';
import 'package:technicaltest/forgot_password.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() {
  testWidgets('ForgotPasswordPage sends password reset email', (WidgetTester tester) async {
    final mockFirebaseAuth = MockFirebaseAuth();
    when(mockFirebaseAuth.sendPasswordResetEmail(email: anyNamed('email')??''))
        .thenAnswer((_) async => {});

    await tester.pumpWidget(
      MaterialApp(
        home: ForgotPasswordPage(),
      ),
    );

    // Find the email TextField and enter an email
    final emailField = find.byType(TextField);
    await tester.enterText(emailField, 'test@example.com');

    // Find the reset button and tap it
    final resetButton = find.byType(ElevatedButton);
    await tester.tap(resetButton);

    // Rebuild the widget
    await tester.pump();

    // Verify that the password reset email was sent
    verify(mockFirebaseAuth.sendPasswordResetEmail(email: 'test@example.com')).called(1);
  });

  testWidgets('ForgotPasswordPage shows error when email is invalid', (WidgetTester tester) async {
    final mockFirebaseAuth = MockFirebaseAuth();
    when(mockFirebaseAuth.sendPasswordResetEmail(email: anyNamed('email')??''))
        .thenThrow(FirebaseAuthException(code: 'user-not-found', message: 'No user found for that email.'));

    await tester.pumpWidget(
      MaterialApp(
        home: ForgotPasswordPage(),
      ),
    );

    // Find the email TextField and enter an invalid email
    final emailField = find.byType(TextField);
    await tester.enterText(emailField, 'invalid@example.com');

    // Find the reset button and tap it
    final resetButton = find.byType(ElevatedButton);
    await tester.tap(resetButton);

    // Rebuild the widget
    await tester.pump();

    // Verify that the error dialog is shown
    expect(find.text('Error sending password reset email: No user found for that email.'), findsOneWidget);
  });
}
