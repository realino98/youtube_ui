import 'package:flutter/material.dart';
import 'package:youtube_ui/pages/login_page.dart';
import 'package:youtube_ui/pages/root_page.dart';
import 'package:youtube_ui/pages/videoplay_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 139, 23, 15)),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      routes: {
        '/homepage': (context) => RootPage(),
      },
      debugShowCheckedModeBanner: false,
      // home: RootPage(),
      home: LoginPage(),
      // home: VideoPlayPage(id: "wKCpeEREeCw"),
    );
  }
}
