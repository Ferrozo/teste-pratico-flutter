import 'package:contactos/src/features/home/presentation/home.dart';
import 'package:contactos/src/features/login/presentation/login_screen.dart';
import 'package:contactos/src/features/onboard/onboard_screen.dart';
import 'package:contactos/src/features/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

// *****************************************************************
//  ARQUIVO QUE CONTEM TODAS AS ROTAS DA APLICAÇÃO USANDO GOROUTER
// *****************************************************************

final routes = GoRouter(
  initialLocation: '/root',
  routes: [
    GoRoute(path: '/root', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/onboardPage', builder: (context, state) => const OnboardScreen()),
    GoRoute(path: '/loginPage', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/homeScreen', builder: (context, state) => const HomeScreen()),
  ],
);
