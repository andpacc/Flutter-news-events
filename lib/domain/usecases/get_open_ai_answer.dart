// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/messages.dart';
import 'package:example/domain/entities/usecase/usecase.dart';
import 'package:example/domain/repositories/chat_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetOpenAiAnswer extends UseCase<Message, GetOpenAiAnswerParams> {
  final ChatRepository _chatRepository;

  GetOpenAiAnswer(this._chatRepository);
  @override
  Future<Either<Failure, Message>> call(params) async {
    return await _chatRepository.getAnswer(params.prompt);
  }
}

class GetOpenAiAnswerParams {
  String prompt;
  GetOpenAiAnswerParams({
    required this.prompt,
  });
}
