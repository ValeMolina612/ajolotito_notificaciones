class PoliticaNotificaciones {
  const PoliticaNotificaciones({
    this.inicioSilencio = 22,
    this.finSilencio = 8,
    this.maximoDiario = 2,
  });
  final int inicioSilencio, finSilencio, maximoDiario;
  bool enSilencio(DateTime fecha) =>
      fecha.hour >= inicioSilencio || fecha.hour < finSilencio;
  DateTime fechaPermitida(DateTime fecha) {
    if (!enSilencio(fecha)) return fecha;
    final base = fecha.hour >= inicioSilencio
        ? fecha.add(const Duration(days: 1))
        : fecha;
    return DateTime(base.year, base.month, base.day, finSilencio);
  }
}
