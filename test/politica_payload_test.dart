import 'package:ajolotito/dominio/payload.dart';
import 'package:ajolotito/dominio/politica.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Rondas 4 y 5 · política y payload', () {
    const p = PoliticaNotificaciones();
    test(
      'respeta horario tranquilo',
      () => expect(p.enSilencio(DateTime(2026, 1, 1, 23)), isTrue),
    );
    test(
      'mueve aviso nocturno a las ocho',
      () => expect(p.fechaPermitida(DateTime(2026, 1, 1, 23)).hour, 8),
    );
    test(
      'payload válido conserva destino',
      () => expect(
        PayloadNotificacion.intentar(
          const PayloadNotificacion(
            destino: Destino.ajustes,
            accion: 'abrir',
          ).aJson(),
        )?.destino,
        Destino.ajustes,
      ),
    );
    test(
      'rechaza payload corrupto',
      () => expect(PayloadNotificacion.intentar('{mal'), isNull),
    );
  });
}
