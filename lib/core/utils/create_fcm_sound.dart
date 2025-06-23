import 'package:smart_notification_manager/core/utils/notification_sound.dart';

createFCMSound(String soundName) {
  final file = NotificationSoundFile().file;

  if (NotificationSoundFile().isNotExist) {
    file.createSync();
  }

  file.writeAsStringSync(NotificationSoundFile.getUpdatedContent());
}
