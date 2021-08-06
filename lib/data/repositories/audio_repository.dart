import 'dart:io';

import 'package:path_provider/path_provider.dart' as ext;

class AudioRepository {
  ///Iterate through the directory specified and return array of path in String type

  getPathToSounds() async {
    List<File>? audioFiles;
    //! -Creates and get external storage for sounds
    Directory? directory = await ext.getExternalStorageDirectory();
    File? pathToAudio = File(directory!.path + "mySongs");

    //! -If the oath specified above do exist

    if (await pathToAudio.exists()) {
      pathToAudio.readAsLinesSync().forEach((pathString) {
        audioFiles?.add(File(pathString));
      });
    } else {
      Directory createdDirectory = await directory.create();
      File? pathToAudio = File(createdDirectory.path + "mySongs");
      pathToAudio.readAsLinesSync().forEach((pathString) {
        audioFiles?.add(File(pathString));
      });
    }

    return audioFiles;
  }

  ///! -Add Audio path (String) to Directory
  Future<String> addAudioPathToDirectory(String audioName) async {
    Directory? directory = await ext.getExternalStorageDirectory();
    File? pathToAudio = File(directory!.path + "mySongs");

    var result = await pathToAudio.writeAsString(audioName);
    print('Audio added and return data file is $result');

    return result.path;
  }

  ///! -Add audio file  to storage

  addAudioFileToStorage(File audioFile) async {
    Directory? directory = await ext.getExternalStorageDirectory();
    File? pathToAudio = File(directory!.path + "mySongs");

    // pathToAudio.absolute.writeAsBytes('ds');
  }
}



//Process outline
//! .1 - get access to external Directory of the phone
//! .2 - create a folder that will contain all audio that we be persisted


//! .3 -  add audio to direectory () method

  //  if directory ==exist? return the path : create the directory  then return the path
  
//! .4 - fecth all the audio path in the storage

