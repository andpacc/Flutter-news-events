import 'package:dart_openai/dart_openai.dart';
import 'package:dartz/dartz.dart';
import 'package:example/data/datasources/chat_datasource.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/messages.dart';
import 'package:example/domain/repositories/chat_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl extends ChatRepository {
  final ChatDataSource chatDataSource;
  final openai = OpenAI.instance;

  ChatRepositoryImpl(this.chatDataSource);

  @override
  Future<Either<Failure, Message>> getAnswer(String prompt) async {
    try {
      final chatResponse = await chatDataSource.getAnswer(prompt);
      return chatResponse;
    } catch (e) {
      return left(OperationFailure());
    }
  }
}
