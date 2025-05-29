import 'package:contactos/src/core/app_assets/app_assets.dart';
import 'package:contactos/src/features/login/presentation/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  context.read<AuthCubit>().checkLoggedUser();
}

  @override
  Widget build(BuildContext context) {
    final appLogo = AppAssets.appTextLogo;

    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listenWhen: (previous, current) =>
            current is AuthSuccess || current is AuthFailure,
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.go('/navBarPage');
          } else if (state is AuthFailure) {
            context.go('/onboardPage');
          }
        },
        child: SafeArea(
          child: Center(child: Image.asset(appLogo, width: 120)),
        ),
      ),
    );
  }
}

