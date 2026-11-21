import 'package:ajolotito/dominio/servicio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'falsos.dart';

void main() {
  group('Ronda 9 · servicio sincronizado', () {
    test('alimentar guarda la fecha y reemplaza agenda', () async {
      final p = PuertoFalso();
      final a = AlmacenMemoria();
      final r = RelojFalso(DateTime(2026, 11, 20, 10));
      final s = ServicioAjolote(puerto: p, almacen: a, reloj: r);
      await s.alimentar();
      expect(a.comida, r.fecha);
      expect(p.programadas.length, 2);
    });
    test('sin permiso cancela la agenda', () async {
      final p = PuertoFalso()..activas = false;
      final a = AlmacenMemoria();
      final r = RelojFalso(DateTime(2026, 11, 20, 10));
      final s = ServicioAjolote(puerto: p, almacen: a, reloj: r);
      expect(await s.sincronizar(s.cargar()), isEmpty);
    });
  });
}
