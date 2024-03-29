extension ListUtils<T> on List<T> {
  Iterable<P> imap<P>(P Function(int index, T value) convert) sync* {
    for (int i = 0; i < length; i++) {
      yield convert(i, this[i]);
    }
  }

  List<T> boolSelect(List<bool> selection) {
    var res = <T>[];
    for (int i = 0; i < length; i++) {
      if (selection[i]) {
        res.add(this[i]);
      }
    }
    return res;
  }
}
