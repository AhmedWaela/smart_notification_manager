import 'dart:io';

class RawFolder {
  static final Directory folder = Directory("android/app/src/main/res/raw");
  static late File originalSound;
  static void addSoundFile(String sound) {
    originalSound = File(sound);
    if (!RawFolder.folder.existsSync()) {
      RawFolder.folder.createSync(recursive: true);
    }

    final filesInFolder = RawFolder.folder.listSync();
    for (var file in filesInFolder) {
      if (file is File && _isSoundFile(file)) {
        file.deleteSync();
      }
    }

    final destinationPath = "${RawFolder.folder.path}/${originalSound.uri.pathSegments.last}";
    originalSound.copySync(destinationPath);
  }

  static bool _isSoundFile(File file) {
    final soundExtensions = [
      '.mp3',
      '.wav',
      '.ogg',
      '.aac',
    ];
    final extension = file.path
        .split('.')
        .last
        .toLowerCase();
    return soundExtensions.contains('.$extension');
  }

  static void addKeepFile() {
    final String keepXmlContent =
        '''<?xml version="1.0" encoding="utf-8"?>
<resources xmlns:tools="http://schemas.android.com/tools"
    tools:shrinkMode="strict"
    tools:keep="@raw/${originalSound.uri.pathSegments.last.split(".").first}"
    tools:discard="@layout/unused_layout" />''';

    final keepFilePath = '${folder.path}/keep.xml';
    File keepFile = File(keepFilePath);
    if (!keepFile.existsSync()) {
      keepFile.createSync(recursive: true);
      
    }
    keepFile.writeAsStringSync(keepXmlContent);
  }
}