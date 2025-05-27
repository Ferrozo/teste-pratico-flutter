import 'package:contactos/src/core/theme/app_theme.dart';
import 'package:contactos/src/core/theme/theme_provider.dart';
import 'package:contactos/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// **********************************
//  PONTO DE ENTRADA DA APLICAÇÃO
// **********************************

void main() {
 runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routes,
      themeMode: ThemeProvider().themeMode,
      darkTheme: AppTheme().darkTheme,
      theme: AppTheme().lightTheme,
    );
  }
}
