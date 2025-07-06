import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:musical_instrument_app/pages/home_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AudioPlayer audioPlayer = AudioPlayer(); // Initialize AudioPlayer globally

  MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(audioPlayer: audioPlayer), // Pass the AudioPlayer to HomeScreen
    );
  }
}