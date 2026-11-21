import 'dart:convert';

enum Destino { inicio, ajustes }

class PayloadNotificacion {
  const PayloadNotificacion({required this.destino, required this.accion});
  final Destino destino;
  final String accion;
  String aJson() =>
      jsonEncode({'v': 1, 'destino': destino.name, 'accion': accion});
  static PayloadNotificacion? intentar(String? texto) {
    try {
      if (texto == null || texto.length > 500) return null;
      final m = jsonDecode(texto);
      if (m is! Map || m['v'] != 1 || m['accion'] is! String) return null;
      Destino? d;
      for (final valor in Destino.values) {
        if (valor.name == m['destino']) d = valor;
      }
      return d == null
          ? null
          : PayloadNotificacion(destino: d, accion: m['accion']);
    } catch (_) {
      return null;
    }
  }
}
