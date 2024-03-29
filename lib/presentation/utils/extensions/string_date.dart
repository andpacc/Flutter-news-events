extension StringDate on String {
  DateTime? toDate() {
    return DateTime.tryParse(this);
  }
}

extension DateString on DateTime {
  String toSimpleIso() => toIso8601String().split('.')[0];
  String get date => toIso8601String().split('T').first;
}
