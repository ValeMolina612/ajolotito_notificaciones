import 'almacen.dart';
import 'categoria.dart';
import 'mascota.dart';
import 'payload.dart';
import 'planificador.dart';
import 'politica.dart';
import 'puerto.dart';
import 'reloj.dart';

class ServicioAjolote {
  ServicioAjolote({
    required this.puerto,
    required this.almacen,
    required this.reloj,
  });
  final PuertoNotificaciones puerto;
  final Almacen almacen;
  final Reloj reloj;
  static const ids = [Planificador.idHambre, Planificador.idSorpresa];

  Mascota cargar() =>
      Mascota(ultimaComida: almacen.leerUltimaComida() ?? reloj.ahora());

  Future<Mascota> alimentar() async {
    final mascota = Mascota(ultimaComida: reloj.ahora());
    await almacen.guardarUltimaComida(mascota.ultimaComida);
    await sincronizar(mascota);
    return mascota;
  }

  Future<List<PlanNotificacion>> sincronizar(Mascota mascota) async {
    for (final id in ids) {
      await puerto.cancelar(id);
    }
    if (!await puerto.notificacionesActivas()) return [];
    final planes = Planificador().crear(
      mascota: mascota,
      ahora: reloj.ahora(),
      politica: const PoliticaNotificaciones(),
    );
    final activas = planes
        .where((p) => almacen.categoriaActiva(p.categoria))
        .toList();
    for (final plan in activas) {
      await puerto.programar(plan);
    }
    return activas;
  }

  Future<void> mostrarBienvenida() => puerto.mostrarAhora(
    id: 100,
    titulo: '¡Ajolotito está listo!',
    cuerpo: 'Te avisaré con cariño cuando tenga hambre.',
    categoria: Categoria.cuidado,
    payload: const PayloadNotificacion(
      destino: Destino.inicio,
      accion: 'ver',
    ).aJson(),
  );
}
