part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {
  const ChatEvent();
}

class InitializedChatEvent extends ChatEvent {}

class SendMessageEvent extends ChatEvent {
  final String message;

  const SendMessageEvent(this.message);
}
