import 'package:flutter/material.dart';
import 'package:slideshow_flutter_app/widgets/slide.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // PageView se utiliza para mostrar una serie de widgets de forma secuencial sobre una página
        // Es útil cuando quieres crear un diseño de tipo "página deslizable", carousels, presentaciones de diapositivas, etc.
        child: PageView(
          // Vistas o diapositivas (puede ser cualquier widget)
          children: const [
            Slide(imageUrl: 'assets/svg/01.svg'),
            Slide(imageUrl: 'assets/svg/02.svg'),
            Slide(imageUrl: 'assets/svg/03.svg')
          ],
        ),
      ),
    );
  }
}
