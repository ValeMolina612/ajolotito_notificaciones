import 'categoria.dart';
import 'planificador.dart';

abstract class PuertoNotificaciones {
  Future<void> inicializar();
  Future<bool> notificacionesActivas();
  Future<bool> pedirPermiso();
  Future<void> programar(PlanNotificacion plan);
  Future<void> mostrarAhora({
    required int id,
    required String titulo,
    required String cuerpo,
    required Categoria categoria,
    required String payload,
  });
  Future<void> cancelar(int id);
  Future<String?> payloadDeLanzamiento();
  void escucharToques(void Function(String? payload) alTocar);
  Future<void> abrirAjustes();
}
