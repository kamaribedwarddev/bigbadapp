import 'package:bigbadapp/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void _onFloatingButtonPressed(){
    print('Floating button pressed');
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Big Bad App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      home: MyHomePage(title: 'Big Bad News App', onButtonPressed: _onFloatingButtonPressed),
    );
  }
}

