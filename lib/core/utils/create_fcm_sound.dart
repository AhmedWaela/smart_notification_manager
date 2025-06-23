import 'package:smart_notification_manager/core/utils/notification_sound.dart';

createFCMSound(String soundName) {
  final file = NotificationSoundFile().file;
  if (!file.existsSync()) {
    file.createSync(recursive: true);
  }

  file.writeAsStringSync(NotificationSoundFile.getUpdatedContent());
}
