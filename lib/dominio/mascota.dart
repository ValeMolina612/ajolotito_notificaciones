enum Humor { feliz, hambriento, famelico }

class Mascota {
  const Mascota({required this.ultimaComida});
  final DateTime ultimaComida;
  int hambre(DateTime ahora) =>
      (ahora.difference(ultimaComida).inMinutes * 2).clamp(0, 100);
  Humor humor(DateTime ahora) {
    final h = hambre(ahora);
    return h >= 80
        ? Humor.famelico
        : h >= 60
        ? Humor.hambriento
        : Humor.feliz;
  }
}
