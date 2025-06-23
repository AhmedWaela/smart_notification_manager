import 'package:smart_notification_manager/core/utils/terminal_colors.dart';

void createTerminalMessage(String message, {TerminalMessageType type = TerminalMessageType.question}) {
  final TerminalColors colors = TerminalColors.instance;
  String coloredMessage;
  String prefix;

  switch (type) {
    case TerminalMessageType.question:
      prefix = '${colors.yellow}❓ [Question]${colors.reset}';
      coloredMessage = '$prefix ${colors.yellow}$message${colors.reset}';
      break;
    case TerminalMessageType.success:
      prefix = '${colors.green}✅ [Success]${colors.reset}';
      coloredMessage = '$prefix ${colors.green}$message${colors.reset}';
      break;
    case TerminalMessageType.error:
      prefix = '${colors.red}❌ [Error]${colors.reset}';
      coloredMessage = '$prefix ${colors.red}$message${colors.reset}';
      break;
    case TerminalMessageType.warning:
      prefix = '${colors.orange}⚠️ [Warning]${colors.reset}';
      coloredMessage = '$prefix ${colors.orange}$message${colors.reset}';
      break;
    case TerminalMessageType.info:
      prefix = '${colors.blue}ℹ️ [Info]${colors.reset}';
      coloredMessage = '$prefix ${colors.blue}$message${colors.reset}';
      break;
  }

  print(coloredMessage);
}

enum TerminalMessageType {
  question,    // Yellow - for user prompts/questions
  success,     // Green - for success messages
  error,       // Red - for error messages
  warning,     // Orange - for warnings
  info,        // Blue - for informational messages
}
