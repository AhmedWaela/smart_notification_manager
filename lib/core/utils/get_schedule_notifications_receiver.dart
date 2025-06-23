import 'package:smart_notification_manager/core/utils/pubspec_file.dart';
import 'package:yaml/yaml.dart';

String getScheduleNotificationReceiver() {
  final doc = loadYaml(PubspecFile().content);
  final name = doc["name"];
  final String receiver =
      '''
  <receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationReceiver" />
  <receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver">
    <intent-filter>
        <action android:name="android.intent.action.BOOT_COMPLETED"/>
        <action android:name="android.intent.action.com.example.$name"/>
        <action android:name="android.intent.action.QUICKBOOT_POWERON" />
        <action android:name="com.htc.intent.action.QUICKBOOT_POWERON"/>
    </intent-filter>
  </receiver>''';
  return receiver;
}
