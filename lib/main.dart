import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'register_page.dart';
import 'login_page.dart'; // Import your login page
import 'home_page.dart'; // Import your home page

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCE37Gk6zkfwb1tH-II3oyEh1V08s7gq1A",
        authDomain: "techincal-987c8.firebaseapp.com",
        projectId: "techincal-987c8", // Corrected project ID
        storageBucket: "techincal-987c8.appspot.com",
        messagingSenderId: "737167644580",
        appId: "1:737167644580:web:42d5a895c09314159e5331",
        measurementId: "G-3MMR9ZFLBN"
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(
    user: FirebaseAuth.instance.currentUser,
    )},
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Show loading indicator while checking user authentication state
          } else {
            if (snapshot.hasData && snapshot.data != null) {
              return HomePage(user: snapshot.data!); // User is logged in, show the home page
            } else {
              return const LoginPage(); // User is not logged in, show the login page
            }
          }
        },
      ),
    );
  }
}