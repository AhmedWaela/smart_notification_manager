class TerminalColors {
  TerminalColors._();
  static final TerminalColors instance = TerminalColors._();

  final String red = '\x1B[31m';
  final String green = '\x1B[32m';
  final String yellow = '\x1B[33m';
  final String blue = '\x1B[34m';
  final String magenta = '\x1B[35m';
  final String cyan = '\x1B[36m';
  final String white = '\x1B[37m';
  final String orange = '\x1B[38;5;208m';
  final String reset = '\x1B[0m';
  
  final String bold = '\x1B[1m';
  final String underline = '\x1B[4m';
  final String italic = '\x1B[3m';
  final String reverse = '\x1B[7m';

  final String bgRed = '\x1B[41m';
  final String bgGreen = '\x1B[42m';
  final String bgYellow = '\x1B[43m';
  final String bgBlue = '\x1B[44m';
}