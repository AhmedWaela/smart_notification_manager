import 'dart:io';

abstract class ConfigFile {
  late File file;
  late List<String> lines;
  late String content;
  ConfigFile(String path) {
    file = File(path);
    lines = file.readAsLinesSync();
    content = file.readAsStringSync();
  }
  bool get isNotExist => !file.existsSync();
}
