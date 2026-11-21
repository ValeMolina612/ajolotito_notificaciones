import 'categoria.dart';
import 'mascota.dart';
import 'payload.dart';
import 'politica.dart';

class PlanNotificacion {
  const PlanNotificacion({
    required this.id,
    required this.cuando,
    required this.titulo,
    required this.cuerpo,
    required this.categoria,
    required this.payload,
  });
  final int id;
  final DateTime cuando;
  final String titulo, cuerpo, payload;
  final Categoria categoria;
}

class Planificador {
  static const idHambre = 1001, idSorpresa = 1002;
  List<PlanNotificacion> crear({
    required Mascota mascota,
    required DateTime ahora,
    required PoliticaNotificaciones politica,
  }) {
    final faltan = ((60 - mascota.hambre(ahora)) / 2).ceil().clamp(1, 60);
    final hambre = politica.fechaPermitida(
      ahora.add(Duration(minutes: faltan)),
    );
    final mediodia = DateTime(ahora.year, ahora.month, ahora.day, 12);
    final sorpresa = politica.fechaPermitida(
      mediodia.isAfter(ahora)
          ? mediodia
          : mediodia.add(const Duration(days: 1)),
    );
    return [
      PlanNotificacion(
        id: idHambre,
        cuando: hambre,
        titulo: 'Tu ajolotito tiene hambre',
        cuerpo: 'Una comidita lo hará muy feliz 💗',
        categoria: Categoria.cuidado,
        payload: const PayloadNotificacion(
          destino: Destino.inicio,
          accion: 'alimentar',
        ).aJson(),
      ),
      PlanNotificacion(
        id: idSorpresa,
        cuando: sorpresa,
        titulo: 'Sorpresa ajolotita',
        cuerpo: 'Recuerda cuidar de ti con la misma ternura.',
        categoria: Categoria.sorpresa,
        payload: const PayloadNotificacion(
          destino: Destino.inicio,
          accion: 'ver',
        ).aJson(),
      ),
    ].take(politica.maximoDiario).toList();
  }
}
