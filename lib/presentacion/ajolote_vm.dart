import 'package:flutter/foundation.dart';
import '../dominio/almacen.dart';
import '../dominio/categoria.dart';
import '../dominio/gestor_permiso.dart';
import '../dominio/mascota.dart';
import '../dominio/planificador.dart';
import '../dominio/reloj.dart';
import '../dominio/servicio.dart';

class AjoloteViewModel extends ChangeNotifier {
  AjoloteViewModel({
    required this.servicio,
    required this.gestor,
    required this.reloj,
    required this.almacen,
  });
  final ServicioAjolote servicio;
  final GestorPermiso gestor;
  final Reloj reloj;
  final Almacen almacen;
  late Mascota mascota;
  List<PlanNotificacion> agenda = [];
  EstadoPermiso permiso = EstadoPermiso.sinPreguntar;
  bool cargando = true;
  Future<void> iniciar() async {
    mascota = servicio.cargar();
    permiso = await gestor.estado();
    agenda = await servicio.sincronizar(mascota);
    cargando = false;
    notifyListeners();
  }

  int get hambre => mascota.hambre(reloj.ahora());
  Future<void> alimentar() async {
    mascota = await servicio.alimentar();
    agenda = await servicio.sincronizar(mascota);
    notifyListeners();
  }

  Future<ResultadoPermiso> activarAvisos() async {
    final r = await gestor.pedirEnContexto();
    permiso = await gestor.estado();
    agenda = await servicio.sincronizar(mascota);
    notifyListeners();
    return r;
  }

  Future<void> abrirAjustesSistema() => gestor.puerto.abrirAjustes();
  bool categoriaActiva(Categoria c) => almacen.categoriaActiva(c);
  Future<void> cambiarCategoria(Categoria c, bool valor) async {
    await almacen.guardarCategoria(c, valor);
    agenda = await servicio.sincronizar(mascota);
    notifyListeners();
  }
}
