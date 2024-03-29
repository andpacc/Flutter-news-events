// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/models/messages.dart';
import '../bloc/chat_bloc.dart';

class HisMessageBubble extends StatefulWidget {
  final Message message;

  const HisMessageBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  _HisMessageBubbleState createState() => _HisMessageBubbleState();
}

class _HisMessageBubbleState extends State<HisMessageBubble>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: colors.onPrimary),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    final dotsCount = (_animation.value * 3).ceil();
                    final dots = List.generate(dotsCount, (_) => '.').join();
                    final displayText = state.chatStateData.isTyping
                        ? dots
                        : widget.message.text;
                    return Text(displayText);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        );
      },
    );
  }
}
