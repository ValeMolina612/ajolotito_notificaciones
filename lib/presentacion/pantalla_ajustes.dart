import 'package:flutter/material.dart';
import '../dominio/categoria.dart';
import '../dominio/gestor_permiso.dart';
import 'ajolote_vm.dart';

class PantallaAjustes extends StatelessWidget {
  const PantallaAjustes({super.key, required this.vm});
  final AjoloteViewModel vm;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Ajustes de avisos')),
    body: ListenableBuilder(
      listenable: vm,
      builder: (_, __) => ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.notifications_active_outlined),
              title: Text(
                vm.permiso == EstadoPermiso.concedido
                    ? 'Notificaciones activas'
                    : 'Notificaciones desactivadas',
              ),
              subtitle: const Text('Tú decides cuándo y qué avisos recibir.'),
              trailing: vm.permiso == EstadoPermiso.denegado
                  ? TextButton(
                      onPressed: vm.abrirAjustesSistema,
                      child: const Text('Abrir ajustes'),
                    )
                  : null,
            ),
          ),
          for (final c in Categoria.values)
            SwitchListTile(
              title: Text(c.titulo),
              subtitle: Text(c.descripcion),
              value: vm.categoriaActiva(c),
              onChanged: (v) => vm.cambiarCategoria(c, v),
            ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Horario tranquilo: de 22:00 a 08:00. Máximo dos avisos al día.',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}
