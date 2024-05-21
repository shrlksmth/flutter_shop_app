import 'package:flutter/material.dart';

import 'cart_provider.dart';
import 'page_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        Provider(create: (context) => "Hello"),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        theme: ThemeData(
          fontFamily: "Kanit",
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.yellowAccent,
              primary: Colors.yellow[600],
              secondary: Colors.lightBlue[50]),
          inputDecorationTheme: InputDecorationTheme(
              hintStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              prefixIconColor: Colors.grey[700]),
          useMaterial3: true,
          textTheme: const TextTheme(
              titleMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              titleSmall: TextStyle(
                fontSize: 17,
              ),
              titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
