import 'package:smart_notification_manager/core/utils/config_file.dart';
import 'package:smart_notification_manager/core/utils/pubspec_file.dart';
import 'package:yaml/yaml.dart';

class NotificationSoundFile extends ConfigFile {
  NotificationSoundFile._() : super(_resolvePath());
  static final NotificationSoundFile _instance = NotificationSoundFile._();
  factory NotificationSoundFile() => _instance;

  /// Resolves the path to the NotificationSound.kt file dynamically.
  static String _resolvePath() {
    final String content = PubspecFile().content;
    final dynamic doc = loadYaml(content);

    if (doc["name"] == null) {
      throw Exception("The 'name' field in pubspec.yaml is missing.");
    }

    final String name = doc["name"];
    return 'android/app/src/main/kotlin/com/example/$name/NotificationSound.kt';
  }

  /// Generates the updated content for NotificationSound.kt dynamically.
  static String getUpdatedContent() {
    final String content = PubspecFile().content;
    final dynamic doc = loadYaml(content);

    if (doc["name"] == null) {
      throw Exception("The 'name' field in pubspec.yaml is missing.");
    }

    if (doc["flutter"] == null || doc["flutter"]["assets"] == null) {
      throw Exception("The 'flutter/assets' field in pubspec.yaml is missing.");
    }

    final String name = doc["name"];
    final YamlList assets = doc["flutter"]["assets"];

    if (assets.isEmpty) {
      throw Exception("No assets found in 'flutter/assets' in pubspec.yaml.");
    }

    final String firstAsset = assets.first;
    final String soundName = firstAsset.split('/').last.split('.').first;

    return '''
package com.example.$name

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.os.Build
import androidx.core.app.NotificationCompat
import android.media.AudioAttributes
import android.net.Uri

object Notifications {
    const val NOTIFICATION_ID_BACKGROUND_SERVICE = 1

    private const val CHANNEL_ID_BACKGROUND_SERVICE = "custom_notification_channel"

    fun createNotificationChannels(context: Context) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val soundUri: Uri = Uri.parse(
                "android.resource://" +
                        context.packageName +
                        "/raw/$soundName"
            )

            val audioAttributes = AudioAttributes.Builder()
                .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                .setUsage(AudioAttributes.USAGE_NOTIFICATION_RINGTONE)
                .build()

            val channel = NotificationChannel(
                CHANNEL_ID_BACKGROUND_SERVICE,
                "Custom Notification Channel",
                NotificationManager.IMPORTANCE_HIGH
            )

            channel.setSound(soundUri, audioAttributes)

            val manager =
                context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            manager.createNotificationChannel(channel)
        }
    }

    fun buildForegroundNotification(context: Context): Notification {
        return NotificationCompat
            .Builder(context, CHANNEL_ID_BACKGROUND_SERVICE)
            .setSmallIcon(R.mipmap.ic_launcher)
            .setContentTitle("Background Service")
            .setContentText("Keeps app process on foreground.")
            .build()
    }
}''';
  }
}
