extension DateUtils on DateTime {
  DateTime get dayStart {
    return DateTime(year, month, day);
  }

  DateTime get dayEnd {
    return DateTime(year, month, day, 23, 59, 59);
  }

  DateTime get weekStart {
    final ws = subtract(Duration(days: weekday));
    return DateTime(ws.year, ws.month, ws.day);
  }

  DateTime get weekEnd {
    final ws = add(Duration(days: 6 - weekday));
    return DateTime(ws.year, ws.month, ws.day, 23, 59, 59);
  }

  DateTime get monthStart {
    return DateTime(year, month, 1);
  }

  DateTime get monthEnd {
    return nextMonth.subtract(const Duration(days: 1));
  }

  DateTime get nextMonth {
    var nextMonth = month + 1;
    var nYear = year;
    if (nextMonth >= 12) {
      nextMonth = 1;
      nYear = year + 1;
    }

    return DateTime(nYear, nextMonth, 1);
  }

  DateTime get prevMonth {
    var prevMonth = month - 1;
    var nYear = year;
    if (prevMonth < 1) {
      prevMonth = 12;
      nYear = year - 1;
    }

    return DateTime(nYear, prevMonth, 1);
  }

  bool isBetween(DateTime start, DateTime end) {
    return compareTo(start) >= 0 && compareTo(end) <= 0;
  }

  DateTime setTime(DateTime dateTime) {
    return DateTime(
      year,
      month,
      day,
      dateTime.hour,
      dateTime.minute,
      dateTime.second,
      dateTime.millisecond,
      dateTime.microsecond,
    );
  }

  DateTime setDate(DateTime dateTime) {
    return DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }
}
