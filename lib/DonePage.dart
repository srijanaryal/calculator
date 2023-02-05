import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DonePage extends StatefulWidget {
  const DonePage({super.key});

  @override
  State<DonePage> createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
          'You are logged in',
          style: TextStyle(color: Colors.red, fontSize: 40),
        ),
      ),
    );
  }
}
