import 'package:flutter/material.dart';
import '../dominio/gestor_permiso.dart';
import 'ajolote_vm.dart';
import 'dibujo_ajolote.dart';
import 'pantalla_ajustes.dart';

class PantallaAjolote extends StatelessWidget {
  const PantallaAjolote({super.key, required this.vm});
  final AjoloteViewModel vm;

  Future<void> _avisos(BuildContext context) async {
    final aceptar =
        await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('¿Te avisamos cuando tenga hambre?'),
            content: const Text(
              'Solo enviaremos avisos útiles, en horario respetuoso y podrás apagarlos cuando quieras.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Ahora no'),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Sí, avísame'),
              ),
            ],
          ),
        ) ??
        false;
    if (!aceptar || !context.mounted) return;
    final resultado = await vm.activarAvisos();
    if (resultado == ResultadoPermiso.hayQueIrAAjustes && context.mounted) {
      await showDialog<void>(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Activa los avisos en Ajustes'),
          content: const Text(
            'Anteriormente rechazaste el permiso. Puedes cambiarlo desde los ajustes del sistema.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
                vm.abrirAjustesSistema();
              },
              child: const Text('Abrir ajustes'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Mi Ajolotito'),
      actions: [
        IconButton(
          tooltip: 'Ajustes',
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PantallaAjustes(vm: vm)),
          ),
          icon: const Icon(Icons.settings_outlined),
        ),
      ],
    ),
    body: ListenableBuilder(
      listenable: vm,
      builder: (_, __) {
        if (vm.cargando)
          return const Center(child: CircularProgressIndicator());
        final h = vm.hambre;
        final tarjetas = vm.agenda.isEmpty
            ? <Widget>[
                const Card(
                  child: ListTile(
                    title: Text('No hay avisos programados'),
                    subtitle: Text(
                      'Activa el permiso para cuidar a tu ajolotito.',
                    ),
                  ),
                ),
              ]
            : vm.agenda
                  .map(
                    (p) => Card(
                      child: ListTile(
                        leading: const Icon(Icons.schedule),
                        title: Text(p.titulo),
                        subtitle: Text(
                          '${p.cuando.day}/${p.cuando.month} · ${p.cuando.hour.toString().padLeft(2, '0')}:${p.cuando.minute.toString().padLeft(2, '0')}',
                        ),
                      ),
                    ),
                  )
                  .toList();
        return ListView(
          padding: const EdgeInsets.fromLTRB(22, 18, 22, 30),
          children: [
            DibujoAjolote(hambre: h),
            const SizedBox(height: 12),
            Text(
              h >= 80
                  ? '¡Tengo mucha hambre!'
                  : h >= 60
                  ? 'Tengo hambre'
                  : '¡Estoy feliz!',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: h / 100,
              minHeight: 12,
              borderRadius: BorderRadius.circular(8),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text('Hambre: $h%', textAlign: TextAlign.center),
            ),
            FilledButton.icon(
              onPressed: vm.alimentar,
              icon: const Icon(Icons.restaurant_rounded),
              label: const Text('Dar de comer'),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () => _avisos(context),
              icon: const Icon(Icons.notifications_active_outlined),
              label: const Text('Avísame cuando tenga hambre'),
            ),
            const SizedBox(height: 22),
            Text(
              'Próximos avisos',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            ...tarjetas,
          ],
        );
      },
    ),
  );
}
