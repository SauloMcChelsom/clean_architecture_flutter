import 'package:permission_handler/permission_handler.dart';

Future<void> permissionDirectory() async {
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }
}
