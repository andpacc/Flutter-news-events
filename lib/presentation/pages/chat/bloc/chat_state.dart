part of 'chat_bloc.dart';

class ChatStateData {
  final List<Message> messages;
  final bool isTyping;
  const ChatStateData({this.messages = const [], this.isTyping = false});

  ChatStateData copyWith({List<Message>? messages, bool? isTyping}) {
    return ChatStateData(
        messages: messages ?? this.messages,
        isTyping: isTyping ?? this.isTyping);
  }
}

@immutable
abstract class ChatState {
  final ChatStateData chatStateData;

  const ChatState({required this.chatStateData});
}

class ChatInitialState extends ChatState {
  const ChatInitialState({super.chatStateData = const ChatStateData()});
}

class ChatLoadedState extends ChatState {
  const ChatLoadedState({required super.chatStateData});
}

class ChatErrorState extends ChatState {
  final String message;

  const ChatErrorState(
      {required ChatStateData chatStateData, required this.message})
      : super(chatStateData: chatStateData);
}
