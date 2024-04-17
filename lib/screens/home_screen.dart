import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slideshow_flutter_app/providers/page_provider.dart';
import 'package:slideshow_flutter_app/widgets/dots.dart';
import 'package:slideshow_flutter_app/widgets/slides.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Registrar el PageProvider en el gestor de estado (Provider)
    // Esto creará una instancia singletón de PageProvider, la cual será gestionada por el gestor de estado Provider.
    // Wigets más arriba declarados en el árbol, no tendrán acceso a PageProvider
    return ChangeNotifierProvider(
      create: (_) => PageProvider(),
      child: const Scaffold(
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
      ),
    );
  }
}
