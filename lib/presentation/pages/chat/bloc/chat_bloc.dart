import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:example/domain/usecases/get_open_ai_answer.dart';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/models/messages.dart';

part 'chat_event.dart';
part 'chat_state.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetOpenAiAnswer getOpenAiAnswer;
  ChatStateData get chatStateData => state.chatStateData;

  ChatBloc(this.getOpenAiAnswer) : super(const ChatInitialState()) {
    on<InitializedChatEvent>(_onInitializedChatEvent);
    on<SendMessageEvent>(_onSendMessageEvent);
  }

  FutureOr<void> _onInitializedChatEvent(
      InitializedChatEvent event, Emitter<ChatState> emit) async {
    final result = await getOpenAiAnswer(GetOpenAiAnswerParams(prompt: "hola"));
    result.fold((l) {
      emit(ChatErrorState(
          chatStateData: chatStateData, message: l.msg ?? "Error chat"));
    }, (r) {
      final updatedMessages = List<Message>.from(chatStateData.messages)
        ..add(r);
      emit(ChatLoadedState(
          chatStateData: chatStateData.copyWith(messages: updatedMessages)));
    });
  }

  FutureOr<void> _onSendMessageEvent(
      SendMessageEvent event, Emitter<ChatState> emit) async {
    final message = Message(
      text: event.message,
      fromWho: FromWho.me,
    );
    final updatedMessages = List<Message>.from(chatStateData.messages)
      ..add(message);
    emit(ChatLoadedState(
        chatStateData:
            chatStateData.copyWith(messages: updatedMessages, isTyping: true)));

    final result =
        await getOpenAiAnswer(GetOpenAiAnswerParams(prompt: event.message));
    result.fold((l) {
      emit(ChatErrorState(
          chatStateData: chatStateData, message: l.msg ?? "Error chat"));
    }, (r) {
      final updatedMessagesWithResponse =
          List<Message>.from(chatStateData.messages)
            ..add(Message(
              text: r.text,
              fromWho: FromWho.his,
            ));
      emit(ChatLoadedState(
          chatStateData: chatStateData.copyWith(
              messages: updatedMessagesWithResponse, isTyping: false)));
    });
  }
}
