import 'package:flutter/material.dart';
import 'package:slideshow_flutter_app/widgets/slide.dart';

// Este widget debe ser StatefulWidget, ya que se necesita obtener información de su estado actual y comunicar esa información a otras partes de mi aplicación
//(Por ejemplo, que dot se debe iluminar de un color distinto con base en la diapositiva actualmente seleccionada)
class Slides extends StatefulWidget {
  const Slides({super.key});

  @override
  State<Slides> createState() => _SlidesState();
}

class _SlidesState extends State<Slides> {
  // Definir un controlador de página que se utilizará para controlar el PageView de forma programatica
  // Controlar su desplazamiento, Observar o reaccionar a eventos, obtener información sobre el estado
  final pageViewController = PageController();

  // Método del ciclo de vida cuando el widget es insertado el árbol de widgets
  @override
  void initState() {
    // añadir un listener al controlador de página para que esté atento a cualquier cambio
    pageViewController.addListener(() {
      // Imprimir la página actual
      // ignore: avoid_print
      print('Página actual: ${pageViewController.page}');
    });
    super.initState();
  }

  // Método del ciclo de vida que es llamado cuando el widget es eliminado
  @override
  void dispose() {
    // Liberar recursos y evitar fugas de memoria asociados al controlador de página
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // PageView se utiliza para mostrar una serie de widgets de forma secuencial sobre una página
    // Es útil cuando quieres crear un diseño de tipo "página deslizable", carousels, presentaciones de diapositivas, etc.
    return PageView(
      // Vincular el controlador de página (pageViewController) con este PageView,
      // por tanto este controlador se encargará de controlar el desplazamiento de este PageView.
      controller: pageViewController,
      // Vistas o diapositivas (puede ser cualquier widget)
      children: const [
        Slide(imageUrl: 'assets/svg/01.svg'),
        Slide(imageUrl: 'assets/svg/02.svg'),
        Slide(imageUrl: 'assets/svg/03.svg')
      ],
    );
  }
}
