import 'package:example/di/dependecy_injector.dart';
import 'package:example/presentation/pages/chat/widgets/his_messages.dart';
import 'package:example/presentation/pages/chat/widgets/message_field_box.dart';
import 'package:example/presentation/pages/chat/widgets/my_messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/models/messages.dart';
import 'bloc/chat_bloc.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ChatBloc>()..add(InitializedChatEvent()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.pop();
            },
          ),
          title: const Text("""\uD83E\uDD16 Soy Simon \uD83E\uDD16"""),
        ),
        body: const _ChatView(),
      ),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
      if (state is ChatInitialState) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is ChatErrorState) {
        return Text(state.message);
      } else {
        final messages = state.chatStateData.messages;
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];

                      return (message.fromWho == FromWho.his)
                          ? HisMessageBubble(
                              message: message,
                            )
                          : MyMessageBubble(
                              message: message,
                            );
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: MesssageFieldBox(
                      onValue: (value) {
                        context.read<ChatBloc>().add(SendMessageEvent(value));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    });
  }
}
