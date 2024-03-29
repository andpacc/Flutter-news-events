import 'package:dartz/dartz.dart';

import '../entities/errors/failures.dart';
import '../entities/models/messages.dart';

abstract class ChatRepository {
  Future<Either<Failure, Message>> getAnswer(String prompt);
}
