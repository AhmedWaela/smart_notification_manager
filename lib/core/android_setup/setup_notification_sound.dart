import 'package:smart_notification_manager/core/utils/add_raw_folder.dart';
import 'package:smart_notification_manager/core/utils/convert_user_answer.dart';
import 'package:smart_notification_manager/core/utils/create_fcm_sound.dart';
import 'package:smart_notification_manager/core/utils/create_proguard_file.dart';
import 'package:smart_notification_manager/core/utils/create_terminal_message.dart';
import 'package:smart_notification_manager/core/utils/get_answer_from_user.dart';
import 'package:smart_notification_manager/core/utils/main_activity_file.dart';
import 'package:smart_notification_manager/core/utils/notification_sound.dart';
import 'package:smart_notification_manager/core/utils/proguard_file.dart';
import 'package:smart_notification_manager/core/utils/pubspec_file.dart';
import 'package:smart_notification_manager/core/utils/update_main_activity.dart';
import 'package:yaml/yaml.dart';

void setupNotificationSound() {
  final String message = "Do you want add notification sound ? (y/n)";
  createTerminalMessage(message, type: TerminalMessageType.question);
  String? answer = getAsnwerFromUser();
  bool isHeWantAddSound = converUserAnswer(answer);

  if (isHeWantAddSound) {
    final String message =
        "Select Type Local only or local and push together ? (a/b)";
    createTerminalMessage(message, type: TerminalMessageType.question);
    String? answer = getAsnwerFromUser();
    bool isHeWantAddLocalOnly = converUserAnswer(answer);
    final doc = loadYaml(PubspecFile().content);
    final YamlList assets = doc["flutter"]["assets"];
    if (isHeWantAddLocalOnly) {
      RawFolder.addSoundFile(assets.first);
      RawFolder.addKeepFile();
      createProguardFile();
    } else {
      RawFolder.addSoundFile(assets.first);
      RawFolder.addKeepFile();
      createProguardFile();
      updateMainActivity(MainActivityFile.getUpdatedContent());
      final String firstAsset = assets.first;
      final String fileName = firstAsset.split('/').last.split('.').first;
      createFCMSound(fileName);
    }
  } else {
    ProguardFile().delete();
    if (RawFolder.folder.existsSync()) {
      RawFolder.folder.deleteSync(recursive: true);
    }
    NotificationSoundFile().delete();
    updateMainActivity(MainActivityFile.getDefaultContent());
  }
}
