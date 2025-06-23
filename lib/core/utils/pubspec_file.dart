import 'package:smart_notification_manager/core/utils/config_file.dart';

class PubspecFile extends ConfigFile {
  PubspecFile._() : super('pubspec.yaml');
  static final PubspecFile _instance = PubspecFile._();
  factory PubspecFile() => _instance;
}