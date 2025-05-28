import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: TextButton(onPressed: ()=> context.go("/loginPage"), child: Text("Entrar")),
      ),
    );
  }
}