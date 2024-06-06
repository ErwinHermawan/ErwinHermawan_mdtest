import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  final User? user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  void _sendEmailVerification(BuildContext context) async {
    try {
      await user!.sendEmailVerification();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Verification email sent. Please check your email.'),
        ),
      );
    } catch (e) {
      //print('Error sending verification email: $e');
    }
  }

  void _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      // print('Error logging out: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error logging out. Please try again.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Welcome ${user!.displayName ?? user!.email}',
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                      const SizedBox(width: 10),
                      user!.emailVerified
                          ? const Icon(Icons.verified, color: Colors.green)
                          : ElevatedButton(
                        onPressed: () => _sendEmailVerification(context),
                        child: const Text('Verify Email'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: constraints.maxHeight * 0.7,
                    ),
                    child: const UserList(),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => _logout(context),
                      child: const Text('Logout'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  bool _showVerifiedUsersOnly = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          title: const Text('Show verified users only'),
          value: _showVerifiedUsersOnly,
          onChanged: (value) {
            setState(() {
              _showVerifiedUsersOnly = value!;
            });
          },
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: _showVerifiedUsersOnly
                ? FirebaseFirestore.instance
                .collection('users')
                .where('emailVerified', isEqualTo: true)
                .snapshots()
                : FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              final users = snapshot.data!.docs;

              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final userData = users[index].data() as Map<String, dynamic>;
                  final userName = userData['username'] ?? 'No Name';
                  final userEmail = userData['email'] ?? 'No Email';
                  final userEmailVerified = userData['emailVerified'] ?? false;

                  return ListTile(
                    title: Text(userName),
                    subtitle: Text(userEmail),
                    trailing: userEmailVerified
                        ? const Icon(Icons.verified, color: Colors.green)
                        : const Icon(Icons.error, color: Colors.red),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}