import 'package:contactos/src/core/app_assets/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
   
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

      context.go('/onboardPage');
  }

  @override
  Widget build(BuildContext context) {
    final appLogo = AppAssets.appTextLogo;
    return Scaffold(
      body: SafeArea(child: Center(child: Image.asset(appLogo, width: 120))),
    );
  }
}
