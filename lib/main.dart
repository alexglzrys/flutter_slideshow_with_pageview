import 'package:flutter/material.dart';
// import 'package:slideshow_flutter_app/screens/home_screen.dart';
// import 'package:slideshow_flutter_app/screens/lab_screen.dart';
import 'package:slideshow_flutter_app/screens/two_slideshow_screen.dart';

void main() => runApp(const SlideshowApp());

class SlideshowApp extends StatelessWidget {
  const SlideshowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Slideshow App',
      // home: HomeScreen(),
      // home: LabScreen(),
      home: TwoSlideshowScreen(),
    );
  }
}
