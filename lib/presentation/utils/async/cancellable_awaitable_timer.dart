import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../domain/entities/errors/failures.dart';

class CancellableAwaitableTimer<T> {
  Completer<Either<Failure, T>>? completer;
  Timer? timer;
  final Duration duration;
  final void Function(void Function(Either<Failure, T> result) onComplete)
      onTick;

  CancellableAwaitableTimer({required this.duration, required this.onTick});

  Future<Either<Failure, T>> start() {
    completer = Completer();

    timer = Timer.periodic(duration, (timer) {
      onTick(
        (result) {
          completer?.complete(result);
          timer.cancel();
        },
      );
    });

    return completer!.future;
  }

  cancel() {
    timer?.cancel();
    if (completer != null && !completer!.isCompleted) {
      completer?.complete(left(CanceledFailure()));
    }
  }
}
