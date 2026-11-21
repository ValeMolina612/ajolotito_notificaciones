import 'package:shared_preferences/shared_preferences.dart';
import '../dominio/almacen.dart';
import '../dominio/categoria.dart';

class AlmacenPrefs implements Almacen {
  AlmacenPrefs(this.prefs);
  final SharedPreferences prefs;
  static const _comida = 'ultima_comida';
  static const _permiso = 'permiso_preguntado';
  @override
  DateTime? leerUltimaComida() {
    final v = prefs.getString(_comida);
    return v == null ? null : DateTime.tryParse(v);
  }

  @override
  Future<void> guardarUltimaComida(DateTime valor) async {
    await prefs.setString(_comida, valor.toIso8601String());
  }

  @override
  bool leerMarcaPermiso() => prefs.getBool(_permiso) ?? false;
  @override
  Future<void> guardarMarcaPermiso(bool valor) async {
    await prefs.setBool(_permiso, valor);
  }

  @override
  bool categoriaActiva(Categoria categoria) =>
      prefs.getBool('categoria_${categoria.name}') ?? true;
  @override
  Future<void> guardarCategoria(Categoria categoria, bool activa) async {
    await prefs.setBool('categoria_${categoria.name}', activa);
  }
}
