abstract class AppRegexValidators {
  static final RegExp urlValidator =
      RegExp(r"^(?:http|https):\/\/+[\w\-.,@?^=%&:/~\\+#]*$");

  // static final RegExp urlValidator = RegExp(
  //     r"^(?:http|https):\/\/[\w\-_]+(?:\.[\w\-_]+)+[\w\-.,@?^=%&:/~\\+#]*$");
}
