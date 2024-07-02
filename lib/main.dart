import 'package:flutter/material.dart';
import 'package:black_coffer_2/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:black_coffer_2/screens/places.dart';
import 'package:firebase_core/firebase_core.dart';

final colorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 102, 6, 247),
    brightness: Brightness.dark);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
      ),
      home: const PlacesScreen(),
    );
  }
}
