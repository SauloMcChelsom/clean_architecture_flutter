import 'dart:io';
import 'package:file_manager/file_manager.dart';
import 'package:path_provider/path_provider.dart';

class StorageService {
  static const NAME = 'LysaEasyMap';

  Future<String> getDirectoryAndroidHome() async {
    Directory? storage = await getExternalStorageDirectory();
    return storage!.path;
  }

  Future<String> getDirectoryUserHome() async{
    List<Directory> storage = await FileManager.getStorageList();
    return storage[0].path;
  }

  Future<void> createFolder(String full_path, String folder_name) async {
    //await FileManager.createFolder('/storage/emulated/0/Download', 'silva');
    await FileManager.createFolder(full_path, folder_name);
  }

  Future<void> listDirectoryUserHome(String full_path) async {
    //Directory dir = Directory('/storage/emulated/0/Download');
    Directory dir = Directory(full_path);
    List<FileSystemEntity> file = dir.listSync();
    //FileManager.basename(file);
  }
}