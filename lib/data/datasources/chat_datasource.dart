import 'package:dart_openai/dart_openai.dart';
import 'package:dartz/dartz.dart';
import 'package:example/domain/entities/errors/failures.dart';
import 'package:example/domain/entities/models/messages.dart';
import 'package:injectable/injectable.dart';

abstract class ChatDataSource {
  Future<Either<Failure, Message>> getAnswer(String prompt);
}

@LazySingleton(as: ChatDataSource)
class ChatDataSourceImpl extends ChatDataSource {
  final openai = OpenAI.instance;

  @override
  Future<Either<Failure, Message>> getAnswer(String prompt) async {
    final chatCompletion = await openai.chat.create(
      model: "gpt-3.5-turbo-1106",
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          content: prompt,
          role: OpenAIChatMessageRole.user,
        ),
      ],
    );

    final content = chatCompletion.choices.first.message.content;

    return Right(Message(
      text: content,
      fromWho: FromWho.his,
      imageUrl: null,
    ));
  }
}
