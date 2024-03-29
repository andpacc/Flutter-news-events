// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MesssageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MesssageFieldBox({
    Key? key,
    required this.onValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
    return TextFormField(
      onTapOutside: (event) => focusNode.unfocus(),
      focusNode: focusNode,
      controller: textController,
      decoration: InputDecoration(
          hintText: "End your message with a '?'",
          enabledBorder:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(40)),
          filled: true,
          focusedBorder:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(40)),
          suffixIcon: IconButton(
              onPressed: () {
                final textValue = textController.value.text;
                textController.clear();
                onValue(textValue);
              },
              icon: const Icon(Icons.send_outlined))),
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
