import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:technicaltest/register_page.dart';

// Define a mock class for User
class MockUser extends Mock implements User {}

// Define a mock class for UserCredential
class MockUserCredential extends Mock implements UserCredential {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() {
  group('Register Page', () {
    late RegisterPage registerPage;
    late MockFirebaseAuth mockFirebaseAuth;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      registerPage = const RegisterPage();
    });

    testWidgets('Registration Success', (WidgetTester tester) async {
      final mockUser = MockUser();
      final mockUserCredential = MockUserCredential();

      when(mockUserCredential.user).thenReturn(mockUser);
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
        email: anyNamed('email')?? '',
        password: anyNamed('password')??'',
      )).thenAnswer((_) async => mockUserCredential);

      await tester.pumpWidget(MaterialApp(home: registerPage));
      await tester.enterText(find.byKey(const Key('username')), 'TestUser');
      await tester.enterText(find.byKey(const Key('email')), 'test@example.com');
      await tester.enterText(find.byKey(const Key('password')), 'password');
      await tester.enterText(find.byKey(const Key('confirm_password')), 'password');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text('Register Page'), findsNothing);
      verify(mockFirebaseAuth.createUserWithEmailAndPassword(
        email: 'test@example.com',
        password: 'password',
      )).called(1);
    });
  });
}
