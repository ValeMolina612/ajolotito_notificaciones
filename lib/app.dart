import 'package:flutter/material.dart';
import 'presentacion/ajolote_vm.dart';
import 'presentacion/pantalla_ajolote.dart';

class AppAjolote extends StatefulWidget {
  const AppAjolote({super.key, required this.vm});
  final AjoloteViewModel vm;
  @override
  State<AppAjolote> createState() => _AppAjoloteState();
}

class _AppAjoloteState extends State<AppAjolote> {
  @override
  void initState() {
    super.initState();
    widget.vm.iniciar();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Ajolotito',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xffff6fae),
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: const Color(0xfffff7fb),
      useMaterial3: true,
    ),
    home: PantallaAjolote(vm: widget.vm),
  );
}
