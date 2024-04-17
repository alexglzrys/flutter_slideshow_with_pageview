import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Widget encargado de mostrar una imagen referente a una vista perteneciente a un PageView
class Slide extends StatelessWidget {
  const Slide({super.key, required this.imageUrl});
  // Url donde se localiza el SVG a renderizar
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      // Flutter tiene soporte para SVG a través del widget SvgPicture correspondiente al paquete de terceros flutter_svg
      child: SvgPicture.asset(imageUrl),
    );
  }
}
