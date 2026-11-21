import 'categoria.dart';

abstract class Almacen {
  DateTime? leerUltimaComida();
  Future<void> guardarUltimaComida(DateTime valor);
  bool leerMarcaPermiso();
  Future<void> guardarMarcaPermiso(bool valor);
  bool categoriaActiva(Categoria categoria);
  Future<void> guardarCategoria(Categoria categoria, bool activa);
}
