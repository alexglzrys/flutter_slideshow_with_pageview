import 'package:flutter/material.dart';
import 'package:slideshow_flutter_app/widgets/slide.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // PageView por defecto ocupa el 100% del viewport del dispositivo.
            // Si se desea usar junto a otros widgets, es importanet asignarle un área limitada donde se pueda expandir.
            Expanded(
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
            const _DotsContainer()
          ],
        ),
      ),
    );
  }
}

// Widget que agrupa un conjunto de puntos
class _DotsContainer extends StatelessWidget {
  const _DotsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(),
          _Dot(),
          _Dot(),
        ],
      ),
    );
  }
}

// Widget privado para representar un punto o circulo en pantalla
class _Dot extends StatelessWidget {
  const _Dot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
    );
  }
}
