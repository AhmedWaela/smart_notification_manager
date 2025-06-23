import 'package:smart_notification_manager/core/utils/config_file.dart';
import 'package:smart_notification_manager/core/utils/pubspec_file.dart';
import 'package:yaml/yaml.dart';

class MainActivityFile extends ConfigFile {
  MainActivityFile._() : super(_resolvePath());

  static final MainActivityFile _instance = MainActivityFile._();

  factory MainActivityFile() => _instance;

  static String _resolvePath() {
    final String content = PubspecFile().content;
    final dynamic doc = loadYaml(content);
    final String? name = doc["name"];
    if (name == null || name.isEmpty) {
      throw Exception("The 'name' field in pubspec.yaml is missing or empty.");
    }
    return 'android/app/src/main/kotlin/com/example/$name/MainActivity.kt';
  }

  static String getUpdatedContent() {
    final String content = PubspecFile().content;
    final dynamic doc = loadYaml(content);
    final String? name = doc["name"];
    if (name == null || name.isEmpty) {
      throw Exception("The 'name' field in pubspec.yaml is missing or empty.");
    }
    final updatedContent =
        '''
package com.example.$name

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import com.example.$name.Notifications

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Notifications.createNotificationChannels(this)
    }
}
''';
    return updatedContent;
  }

  static String getDefaultContent() {
    final String content = PubspecFile().content;
    final dynamic doc = loadYaml(content);
    final String? name = doc["name"];
    return '''package com.example.$name

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
}
''';
  }
}
