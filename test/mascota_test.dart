import 'package:ajolotito/dominio/mascota.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Ronda 2 · reloj y mascota', () {
    final base = DateTime(2026, 11, 20, 10);
    test(
      'nace sin hambre',
      () => expect(Mascota(ultimaComida: base).hambre(base), 0),
    );
    test(
      'hambre aumenta dos puntos por minuto',
      () => expect(
        Mascota(
          ultimaComida: base,
        ).hambre(base.add(const Duration(minutes: 30))),
        60,
      ),
    );
    test(
      'hambre tiene tope de cien',
      () => expect(
        Mascota(ultimaComida: base).hambre(base.add(const Duration(hours: 5))),
        100,
      ),
    );
    test(
      'cambia de humor según hambre',
      () => expect(
        Mascota(
          ultimaComida: base,
        ).humor(base.add(const Duration(minutes: 45))),
        Humor.famelico,
      ),
    );
  });
}
