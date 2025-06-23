extension LineHelper on String {
  /// Returns the line number (index) of the first occurrence of the string in the list of lines.
  /// If not found, it returns -1.
  int getLineIndexIn(List<String> lines) {
    final int lineIndex = lines.indexWhere(
      (String line) => line.trim().contains(this),
    );
    return lineIndex;
  }

  /// Checks if the string exists in any of the lines in the list.
  bool existsInLines(List<String> lines) {
    final bool exists = lines.any((String line) => line.trim().contains(this));
    return exists;
  }
}
