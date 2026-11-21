import 'package:ajolotito/dominio/gestor_permiso.dart';
import 'package:ajolotito/dominio/servicio.dart';
import 'package:ajolotito/presentacion/ajolote_vm.dart';
import 'package:flutter_test/flutter_test.dart';
import 'falsos.dart';

void main() {
  test('Ronda 11 · view model inicia, alimenta y expone agenda', () async {
    final p = PuertoFalso();
    final a = AlmacenMemoria();
    final r = RelojFalso(DateTime(2026, 11, 20, 10));
    final s = ServicioAjolote(puerto: p, almacen: a, reloj: r);
    final vm = AjoloteViewModel(
      servicio: s,
      gestor: GestorPermiso(puerto: p, almacen: a),
      reloj: r,
      almacen: a,
    );
    await vm.iniciar();
    expect(vm.cargando, isFalse);
    expect(vm.agenda.length, 2);
    await vm.alimentar();
    expect(vm.hambre, 0);
  });
}
