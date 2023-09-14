import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:code_casa_stopwatch/provider/stopwatch_provider.dart';
import 'screens/home_screen.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      home: ChangeNotifierProvider<StopWatchProvider>(
          create: (context) => StopWatchProvider(),
          child: HomeScreen()),
    );
  }
}
