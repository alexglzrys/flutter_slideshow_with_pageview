import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slideshow_flutter_app/components/slideshow.dart';

// Widget que representa una página con dos slideshow (pageView)
class TwoSlideshowScreen extends StatelessWidget {
  const TwoSlideshowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // PageView trata de ocupar todo el espacio disponible en la pantalla, sin embargo como existe más contenido en la misma, es importante definir de forma explicita el tamaño o área que ocuapra
          // para ello se usa Expanden, en este sentido ambiso usarán el 50% dek alto de la pantalla, y el 100% del ancho de la misma
          Expanded(
            // Primer Slideshow
            child: Slideshow(
              slides: [
                SvgPicture.asset('assets/svg/01.svg'),
                SvgPicture.asset('assets/svg/02.svg'),
              ],
              buttonPrimaryColor: Colors.teal,
              buttonSecondaryColor: Colors.grey[500]!,
            ),
          ),
          Expanded(
            // Segundo Slideshow
            child: Slideshow(
              slides: [
                SvgPicture.asset('assets/svg/03.svg'),
                SvgPicture.asset('assets/svg/04.svg'),
                SvgPicture.asset('assets/svg/05.svg'),
              ],
              buttonPrimaryColor: Colors.purple,
              buttonSecondaryColor: Colors.grey[300]!,
            ),
          ),
        ],
      ),
    );
  }
}
