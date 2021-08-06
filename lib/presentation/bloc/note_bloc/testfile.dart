import 'package:just_audio/just_audio.dart';

class CSd {
  AudioPlayer? player = AudioPlayer();

  playAuido(String filePath) async {
    await player?.setFilePath(filePath);

    await player?.play();
  }
}

//TODO:  PLAY with the recording on

class PlayClass {
  final String? fieldName;

  PlayClass(this.fieldName);
}

extension playExt on PlayClass {
  void printFieldName() {
    print(this.fieldName);
    print('Such is the power of extension');
  }
}
