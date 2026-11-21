import 'package:ajolotito/dominio/almacen.dart';
import 'package:ajolotito/dominio/categoria.dart';
import 'package:ajolotito/dominio/planificador.dart';
import 'package:ajolotito/dominio/puerto.dart';
import 'package:ajolotito/dominio/reloj.dart';

class RelojFalso implements Reloj {
  RelojFalso(this.fecha);
  DateTime fecha;
  @override
  DateTime ahora() => fecha;
}

class AlmacenMemoria implements Almacen {
  DateTime? comida;
  bool marca = false;
  final categorias = <Categoria, bool>{};
  @override
  DateTime? leerUltimaComida() => comida;
  @override
  Future<void> guardarUltimaComida(DateTime v) async {
    comida = v;
  }

  @override
  bool leerMarcaPermiso() => marca;
  @override
  Future<void> guardarMarcaPermiso(bool v) async {
    marca = v;
  }

  @override
  bool categoriaActiva(Categoria c) => categorias[c] ?? true;
  @override
  Future<void> guardarCategoria(Categoria c, bool v) async {
    categorias[c] = v;
  }
}

class PuertoFalso implements PuertoNotificaciones {
  bool activas = true, usuarioAcepta = true;
  int vecesPidio = 0, ajustes = 0;
  String? lanzamiento;
  final programadas = <int, PlanNotificacion>{};
  final mostradas = <String>[];
  void Function(String?)? toque;
  @override
  Future<void> inicializar() async {}
  @override
  Future<bool> notificacionesActivas() async => activas;
  @override
  Future<bool> pedirPermiso() async {
    vecesPidio++;
    activas = usuarioAcepta;
    return usuarioAcepta;
  }

  @override
  Future<void> programar(PlanNotificacion p) async {
    programadas[p.id] = p;
  }

  @override
  Future<void> cancelar(int id) async {
    programadas.remove(id);
  }

  @override
  Future<void> mostrarAhora({
    required int id,
    required String titulo,
    required String cuerpo,
    required Categoria categoria,
    required String payload,
  }) async {
    mostradas.add(titulo);
  }

  @override
  Future<String?> payloadDeLanzamiento() async => lanzamiento;
  @override
  void escucharToques(void Function(String?) f) => toque = f;
  @override
  Future<void> abrirAjustes() async {
    ajustes++;
  }
}
