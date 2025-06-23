extension AnswerConverterExtension on String {
  bool? convert() {
    if (this == "y" || this == "a") {
      return true;
    } else if (this == "n" || this == "b") {
      return false;
    }
    return null;
  }
}
