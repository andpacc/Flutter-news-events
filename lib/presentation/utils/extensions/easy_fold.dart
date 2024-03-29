import 'package:dartz/dartz.dart';

extension EasyFold<L, R> on Either<L, R> {
  R? get rightValue {
    return foldRight(null, (r, previous) => r);
  }

  L? get leftValue {
    final lf = this;
    if (lf is Left<L, R>) {
      return lf.value;
    }
    return null;
  }
}
