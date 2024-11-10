import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart';
import 'package:provider_app/screens/my_home_page.dart';
import './models/event_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => EventModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'manejo de eventos',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(),
    );
  }
}
