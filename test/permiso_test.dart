import 'package:ajolotito/dominio/gestor_permiso.dart';
import 'package:flutter_test/flutter_test.dart';
import 'falsos.dart';

void main() {
  group('Ronda 8 · permiso responsable', () {
    test('si ya está activo no vuelve a pedir', () async {
      final p = PuertoFalso();
      final g = GestorPermiso(puerto: p, almacen: AlmacenMemoria());
      expect(await g.pedirEnContexto(), ResultadoPermiso.yaConcedido);
      expect(p.vecesPidio, 0);
    });
    test('registra rechazo y no insiste', () async {
      final p = PuertoFalso()
        ..activas = false
        ..usuarioAcepta = false;
      final a = AlmacenMemoria();
      final g = GestorPermiso(puerto: p, almacen: a);
      expect(await g.pedirEnContexto(), ResultadoPermiso.denegado);
      expect(await g.pedirEnContexto(), ResultadoPermiso.hayQueIrAAjustes);
      expect(p.vecesPidio, 1);
    });
  });
}
