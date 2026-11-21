import 'package:ajolotito/dominio/mascota.dart';
import 'package:ajolotito/dominio/planificador.dart';
import 'package:ajolotito/dominio/politica.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Ronda 6 · planificador', () {
    final ahora = DateTime(2026, 11, 20, 10);
    final planes = Planificador().crear(
      mascota: Mascota(ultimaComida: ahora),
      ahora: ahora,
      politica: const PoliticaNotificaciones(),
    );
    test('crea hambre y sorpresa', () => expect(planes.length, 2));
    test(
      'usa ids estables',
      () => expect(planes.map((e) => e.id), containsAll([1001, 1002])),
    );
    test(
      'incluye payload navegable',
      () => expect(planes.first.payload, contains('alimentar')),
    );
  });
}
