import 'package:ajolotito/app.dart';
import 'package:ajolotito/dominio/gestor_permiso.dart';
import 'package:ajolotito/dominio/servicio.dart';
import 'package:ajolotito/presentacion/ajolote_vm.dart';
import 'package:flutter_test/flutter_test.dart';
import 'falsos.dart';

void main() {
  testWidgets('Ronda 11 · pantalla muestra ajolote y controles', (
    tester,
  ) async {
    final p = PuertoFalso();
    final a = AlmacenMemoria();
    final r = RelojFalso(DateTime(2026, 11, 20, 10));
    final vm = AjoloteViewModel(
      servicio: ServicioAjolote(puerto: p, almacen: a, reloj: r),
      gestor: GestorPermiso(puerto: p, almacen: a),
      reloj: r,
      almacen: a,
    );
    await tester.pumpWidget(AppAjolote(vm: vm));
    await tester.pumpAndSettle();
    expect(find.text('Mi Ajolotito'), findsOneWidget);
    expect(find.text('Dar de comer'), findsOneWidget);
    expect(find.text('Próximos avisos'), findsOneWidget);
  });
}
