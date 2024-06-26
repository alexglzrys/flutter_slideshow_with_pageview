import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  const Slideshow(
      {super.key,
      required this.slides,
      required this.buttonPrimaryColor,
      required this.buttonSecondaryColor,
      this.buttonTop = false,
      this.sizeActiveButton = 12,
      this.sizeDeactiveButton = 12});
  // Listado de widgets a mostrar dentro del PageView
  final List<Widget> slides;
  // Color de los botones indicadores
  final Color buttonPrimaryColor;
  final Color buttonSecondaryColor;
  // Posición del contenedor de botones
  final bool buttonTop;
  // Tamaño botones activo y desactivos
  final double sizeActiveButton;
  final double sizeDeactiveButton;

  @override
  Widget build(BuildContext context) {
    // El componente Slideshow usa Provider como gestor de estado para el tema del manejo de las slides
    return ChangeNotifierProvider(
      // Durante la creación de la instancia de _PageProvider, le pasamos información de inicialización referente a los colores.
      create: (_) => _PageProvider(
          primaryColor: buttonPrimaryColor,
          secondaryColor: buttonSecondaryColor,
          sizeActive: sizeActiveButton,
          sizeDeactive: sizeDeactiveButton),
      // Al declarar el contenedor de los botones en la parte superior, este se ve afectado por el notch, por ello el todo el contenido se declara dentro de un área segura con SafeArea
      child: SafeArea(
        child: Center(
            child: Column(
          children: [
            if (buttonTop) _Dots(slides.length),
            // PageView por defecto ocupa el 100% del viewport del dispositivo.
            // Si se desea usar junto a otros widgets, es importanet asignarle un área limitada donde se pueda expandir.
            Expanded(
              child: _Slides(slides),
            ),

            if (!buttonTop) _Dots(slides.length),
          ],
        )),
      ),
    );
  }
}

// Este widget debe ser StatefulWidget, ya que se necesita obtener información de su estado actual y comunicar esa información a otras partes de mi aplicación
// Por ejemplo, que dot se debe iluminar de un color distinto con base en la diapositiva actualmente seleccionada
class _Slides extends StatefulWidget {
  const _Slides(this.slides, {super.key});
  // Listado de widgets a mostrar dentro del PageView
  final List<Widget> slides;

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  // Definir un controlador de página que se utilizará para controlar el PageView de forma programatica
  // Controlar su desplazamiento, Observar o reaccionar a eventos, obtener información sobre el estado
  final pageViewController = PageController();

  // Método del ciclo de vida cuando el widget es insertado el árbol de widgets
  @override
  void initState() {
    // añadir un listener al controlador de página para que esté atento a cualquier cambio
    pageViewController.addListener(() {
      // Obtener la instancia de mi PageProvider y establecer la nueva página seleccionada
      Provider.of<_PageProvider>(context, listen: false).currentPage =
          pageViewController.page!;
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
        // Mapear el listado slides
        // Por cada widget en el listado de slides, crear un _Slide y pasarle el widget como argumento.
        // Finalmente, convertir el resultado del map (iterable) en una lista
        children: widget.slides.map((slide) => _Slide(slide)).toList());
  }
}

// Widget encargado de mostrar un widget genérico referente a una vista perteneciente a un PageView
class _Slide extends StatelessWidget {
  const _Slide(this.slide, {super.key});
  // Widget a renderizar como hijo del slide
  final Widget slide;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: slide,
    );
  }
}

// Widget que agrupa un conjunto de puntos
class _Dots extends StatelessWidget {
  const _Dots(
    this.numDots, {
    super.key,
  });
  // El número de puntos a dibujar en pantalla (se debe corresponder con la cantidad de slides)
  final int numDots;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // El constructor List.generate en Dart permite generar una lista con un tamaño específico y llenarla con elementos generados dinámicamente
          children: List.generate(numDots, (index) => _Dot(index)),
        ));
  }
}

// Widget privado para representar un punto o circulo en pantalla
class _Dot extends StatelessWidget {
  const _Dot(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    // Obtener la instancia de mi PageProvider
    final pageProvider = Provider.of<_PageProvider>(context);

    // AnimatedContainer anima automáticamente los cambios en las propiedades de su contenedor, como alignment, padding, color, decoration, width, height, etc.
    // Es especialmente útil cuando deseas que un contenedor cambie su aspecto de forma animada en respuesta a algún evento, como un botón presionado o un cambio en el estado de la aplicación.
    return AnimatedContainer(
      // Duración de la animación
      duration: const Duration(milliseconds: 200),
      // Tipo de animación
      curve: Curves.slowMiddle,
      // El tamaño de cada bullet es diferente si se encuenrta activo o desactivado
      width: isActive(pageProvider)
          ? pageProvider.sizeActiveButton
          : pageProvider.sizeDeactiveButton,
      height: isActive(pageProvider)
          ? pageProvider.sizeActiveButton
          : pageProvider.sizeDeactiveButton,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // Cambiar el color si el indice de este punto se corresponde la página actualmente seleccionada
        color: isActive(pageProvider)
            ? pageProvider.buttonPrimaryColor
            : pageProvider.buttonSecondaryColor,
      ),
    );
  }

  // Método utilitario que determina si una página se encuentra activa o desactiva
  bool isActive(_PageProvider pageProvider) {
    return (pageProvider.currentPage >= index - .5 &&
            pageProvider.currentPage < index + .5)
        ? true
        : false;
  }
}

// Provider encargado de admistrar todo lo referente a las páginas o vistas mostradas en el PageView principal de este componente
// Extiende de ChangeNotifier para notificar los cambios
class _PageProvider extends ChangeNotifier {
  _PageProvider(
      {required primaryColor,
      required secondaryColor,
      required sizeActive,
      required sizeDeactive}) {
    buttonPrimaryColor = primaryColor;
    buttonSecondaryColor = secondaryColor;
    sizeActiveButton = sizeActive;
    sizeDeactiveButton = sizeDeactive;
  }

  // Propiedad privada que almacena la página actual
  double _currentPage = 0;
  // Estas propiedades se inicializarán de forma parezosa en el contructor de la clase
  late Color _buttonPrimaryColor;
  late Color _buttonSecondaryColor;
  // Tamaño botones activo y desactivos
  late double _sizeActiveButton;
  late double _sizeDeactiveButton;

  // Getter para obtener la página actual
  double get currentPage => _currentPage;

  // Setter para establecer la página actual
  set currentPage(double page) {
    _currentPage = page;
    // Notificar a todos los listeners que la página actual ha cambiado (los widgets suscritos a este provider deben volver a renderizarse)
    notifyListeners();
  }

  // Getter y Setter color primario referente a los botones indicadores
  Color get buttonPrimaryColor => _buttonPrimaryColor;
  set buttonPrimaryColor(Color color) {
    _buttonPrimaryColor = color;
    notifyListeners();
  }

  // Getter y Setter color secundario referente a los botones indicadores
  Color get buttonSecondaryColor => _buttonSecondaryColor;
  set buttonSecondaryColor(Color color) {
    _buttonSecondaryColor = color;
    notifyListeners();
  }

  // Getter y Setter tamaño boton o bullet activo
  double get sizeActiveButton => _sizeActiveButton;
  set sizeActiveButton(double size) {
    _sizeActiveButton = size;
    notifyListeners();
  }

  // Getter y Setter tamaño boton o bullet inactivo
  double get sizeDeactiveButton => _sizeDeactiveButton;
  set sizeDeactiveButton(double size) {
    _sizeDeactiveButton = size;
    notifyListeners();
  }
}
