import 'package:intl/intl.dart';

class FormateadorFecha {
  static String formatFecha(DateTime fecha) {
    final formato = DateFormat('dd/MM/yyyy HH:mm');
    return formato.format(fecha);
  }

  static String formatFecha2(DateTime fecha) {
    final formato = DateFormat('dd/MM/yyyy');
    return formato.format(fecha);
  }
}
