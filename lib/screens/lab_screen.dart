import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slideshow_flutter_app/components/slideshow.dart';

class LabScreen extends StatelessWidget {
  const LabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slideshow(
        // Nuestro componente Slideshow acepta cualquier listado de widgets, los cuales se mostrarán dentro de un PageView
        slides: [
          SvgPicture.asset('assets/svg/01.svg'),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/03.svg',
                height: 400,
              ),
              const Text(
                'Sabías que tus compras se convierten en múltiples premios y beneficios',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SvgPicture.asset('assets/svg/02.svg'),
          SvgPicture.asset('assets/svg/04.svg'),
          SvgPicture.asset('assets/svg/05.svg')
        ],
        buttonPrimaryColor: Colors.pink[200]!,
        buttonSecondaryColor: Colors.grey[300]!,
        buttonTop: false,
        sizeActiveButton: 16,
        sizeDeactiveButton: 12,
      ),
    );
  }
}
