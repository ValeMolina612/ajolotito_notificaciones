enum Categoria { cuidado, sorpresa }

extension CategoriaInfo on Categoria {
  String get titulo =>
      this == Categoria.cuidado ? 'Cuidado del ajolotito' : 'Sorpresas';
  String get descripcion => this == Categoria.cuidado
      ? 'Avisos de hambre y bienestar'
      : 'Mensajes amables ocasionales';
}
