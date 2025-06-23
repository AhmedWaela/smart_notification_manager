import 'package:smart_notification_manager/core/utils/answer_converter_extension.dart';
import 'package:smart_notification_manager/core/utils/get_answer_from_user.dart';

bool converUserAnswer(String? answer) {
  bool? convertedAnswer = answer?.convert();
  while (convertedAnswer == null) {
    print("please enter a valid answer");
    answer = getAsnwerFromUser();
    convertedAnswer = answer?.convert();
  }
  return convertedAnswer;
}
