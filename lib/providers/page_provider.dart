import 'package:flutter/material.dart';

// Provider encargado de admistrar todo lo referente a las páginas o vistas mostradas en el PageView principal de la aplicación
// Extiende de ChangeNotifier para notificar los cambios
class PageProvider extends ChangeNotifier {
  // Propiedad privada que almacena la página actual
  double _currentPage = 0;

  // Getter para obtener la página actual
  double get currentPage => _currentPage;

  // Setter para establecer la página actual
  set currentPage(double page) {
    _currentPage = page;
    // Notificar a todos los listeners que la página actual ha cambiado (los widgets suscritos a este provider deben volver a renderizarse)
    notifyListeners();
  }
}
