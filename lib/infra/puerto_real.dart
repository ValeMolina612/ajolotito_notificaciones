import 'package:flutter/services.dart';
import '../dominio/categoria.dart';
import '../dominio/planificador.dart';
import '../dominio/puerto.dart';

class PuertoReal implements PuertoNotificaciones {
  static const _canal = MethodChannel('ajolotito/notificaciones');
  void Function(String?)? _alTocar;
  @override Future<void> inicializar() async { _canal.setMethodCallHandler((call) async { if (call.method == 'toque') _alTocar?.call(call.arguments as String?); }); await _canal.invokeMethod<void>('inicializar'); }
  @override Future<bool> notificacionesActivas() async => await _canal.invokeMethod<bool>('activas') ?? true;
  @override Future<bool> pedirPermiso() async => await _canal.invokeMethod<bool>('pedirPermiso') ?? true;
  @override Future<void> programar(PlanNotificacion p) => _canal.invokeMethod<void>('programar', {'id':p.id,'cuando':p.cuando.millisecondsSinceEpoch,'titulo':p.titulo,'cuerpo':p.cuerpo,'categoria':p.categoria.name,'payload':p.payload});
  @override Future<void> mostrarAhora({required int id,required String titulo,required String cuerpo,required Categoria categoria,required String payload}) => _canal.invokeMethod<void>('mostrar', {'id':id,'titulo':titulo,'cuerpo':cuerpo,'categoria':categoria.name,'payload':payload});
  @override Future<void> cancelar(int id) => _canal.invokeMethod<void>('cancelar', id);
  @override Future<String?> payloadDeLanzamiento() => _canal.invokeMethod<String>('lanzamiento');
  @override void escucharToques(void Function(String? payload) alTocar) => _alTocar=alTocar;
  @override Future<void> abrirAjustes() => _canal.invokeMethod<void>('ajustes');
}
