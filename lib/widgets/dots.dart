import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slideshow_flutter_app/providers/page_provider.dart';

// Widget que agrupa un conjunto de puntos
class Dots extends StatelessWidget {
  const Dots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(0),
          _Dot(1),
          _Dot(2),
        ],
      ),
    );
  }
}

// Widget privado para representar un punto o circulo en pantalla
class _Dot extends StatelessWidget {
  const _Dot(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    // Obtener la instancia de mi PageProvider y leer la página actualmente seleccionada
    final pageViewIndex = Provider.of<PageProvider>(context).currentPage;
    return Container(
      width: 15,
      height: 15,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // Cambiar el color si el indice de este punto se corresponde la página actualmente seleccionada
        color: (pageViewIndex == index) ? Colors.pink[300] : Colors.grey,
      ),
    );
  }
}
