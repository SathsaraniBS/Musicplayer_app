import 'package:flutter/material.dart';
//import 'pages/home_page.dart';
import 'package:provider/provider.dart';
import 'themes/theme_provider.dart';
import 'models/playlist_provider.dart';
//import 'package:audioplayers/audioplayers.dart';
import 'package:musical_instrument_app/pages/login_page.dart';
void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider(),),
      ChangeNotifierProvider(create: (context) => PlaylistProvider(),),
    ],
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
    //home: HomePage(), 
    //home: HomePage(audioPlayer: AudioPlayer()), 
    //theme: Provider.of<ThemeProvider>(context).themeData, /
    home: const LoginPage(),
  );
}
}