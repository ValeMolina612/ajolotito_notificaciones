abstract interface class Reloj {
  DateTime ahora();
}

class RelojSistema implements Reloj {
  @override
  DateTime ahora() => DateTime.now();
}
