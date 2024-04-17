import 'package:flutter/material.dart';
import 'package:slideshow_flutter_app/widgets/dots.dart';
import 'package:slideshow_flutter_app/widgets/slides.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            // PageView por defecto ocupa el 100% del viewport del dispositivo.
            // Si se desea usar junto a otros widgets, es importanet asignarle un área limitada donde se pueda expandir.
            Expanded(
              child: Slides(),
            ),
            Dots(),
          ],
        ),
      ),
    );
  }
}
