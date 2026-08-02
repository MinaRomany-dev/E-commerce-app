import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageFunctions {
  static Future<File?> getGallery() async {
    late PermissionStatus permissionStatus;
    if (Platform.isAndroid) {
      final deviceInfo = await DeviceInfoPlugin().androidInfo;
      if (deviceInfo.version.sdkInt >= 33) {
        permissionStatus = await Permission.photos.request();
      } else {
        permissionStatus = await Permission.storage.request();
      }
    } else {
      permissionStatus = await Permission.photos.request();
    }
    if (permissionStatus.isGranted) {
      var image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
      );
      if (image != null) {
        return File(image.path);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<File?> getCamera() async {
    var image = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 70,
    );
    if (image != null) {
      return File(image.path);
    } else {
      return null;
    }
  }
}
