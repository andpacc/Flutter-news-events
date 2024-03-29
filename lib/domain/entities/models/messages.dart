enum FromWho { me, his }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  final bool? isTyping;

  Message(
      {this.text = "hola",
      this.imageUrl,
      this.fromWho = FromWho.me,
      this.isTyping = false});
}
