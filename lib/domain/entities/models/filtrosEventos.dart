class FiltrosEventos {
  final DateTime? fechaInicial;
  final DateTime? fechaFinal;
  final String? localidad;
  final List<int> categorias;
  final bool entradaLibre;

  FiltrosEventos({
    this.fechaInicial,
    this.fechaFinal,
    this.localidad,
    this.categorias = const [],
    this.entradaLibre = false,
  });
}
