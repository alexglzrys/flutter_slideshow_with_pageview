import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Flutter tiene soporte para SVG a través del widget SvgPicture correspondiente al paquete de terceros flutter_svg
        child: SvgPicture.asset(
          'assets/svg/03.svg',
          width: 280,
        ),
      ),
    );
  }
}
