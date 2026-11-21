import 'almacen.dart';
import 'puerto.dart';

enum EstadoPermiso { sinPreguntar, concedido, denegado }

enum ResultadoPermiso { yaConcedido, concedido, denegado, hayQueIrAAjustes }

class GestorPermiso {
  GestorPermiso({required this.puerto, required this.almacen});
  final PuertoNotificaciones puerto;
  final Almacen almacen;

  Future<EstadoPermiso> estado() async {
    if (await puerto.notificacionesActivas()) return EstadoPermiso.concedido;
    return almacen.leerMarcaPermiso()
        ? EstadoPermiso.denegado
        : EstadoPermiso.sinPreguntar;
  }

  Future<ResultadoPermiso> pedirEnContexto() async {
    final actual = await estado();
    if (actual == EstadoPermiso.concedido) return ResultadoPermiso.yaConcedido;
    if (actual == EstadoPermiso.denegado)
      return ResultadoPermiso.hayQueIrAAjustes;
    await almacen.guardarMarcaPermiso(true);
    return await puerto.pedirPermiso()
        ? ResultadoPermiso.concedido
        : ResultadoPermiso.denegado;
  }
}
