import 'package:contactos/src/core/theme/app_theme.dart';
import 'package:contactos/src/core/theme/theme_provider.dart';
import 'package:contactos/src/di/dependencie_injection.dart' as di;
import 'package:contactos/src/di/dependencie_injection.dart';
import 'package:contactos/src/features/home/presentation/cubit/contacts_cubit.dart';
import 'package:contactos/src/features/login/presentation/auth_cubit/auth_cubit.dart';
import 'package:contactos/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

// **********************************
//  PONTO DE ENTRADA DA APLICAÇÃO
// **********************************

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();    
  await sl.allReady(); 
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<AuthCubit>()),
        BlocProvider(create: (context) => di.sl<ContactsCubit>())
        ],
      child: MaterialApp.router(
        routerConfig: routes,
        themeMode: context.watch<ThemeProvider>().themeMode,
        darkTheme: AppTheme().darkTheme,
        theme: AppTheme().lightTheme,
      ),
    );
  }
}
