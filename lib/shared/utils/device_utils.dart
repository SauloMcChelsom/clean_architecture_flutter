import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet }

class DeviceConstants {
  const DeviceConstants._();

  static const designDeviceWidth = 375.0;
  static const designDeviceHeight = 667.0;

  static const maxMobileWidth = 450;
  static const maxTabletWidth = 900;

  static const maxMobileWidthForDeviceType = 550;
}

class DeviceUtils {
  const DeviceUtils._();
  static late DeviceType deviceType = _getDeviceType();

  static Future<String> getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final iosDeviceInfo = await deviceInfo.iosInfo;

      return iosDeviceInfo.identifierForVendor ?? '';
    } else {
      final androidDeviceInfo = await deviceInfo.androidInfo;

      return androidDeviceInfo.device;
    }
  }

  static Future<String> getDeviceModelName() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

      return iosInfo.name ?? '';
    } else {
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      return '${androidInfo.brand} ${androidInfo.device}';
    }
  }

  static DeviceType _getDeviceType() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);

    return data.size.shortestSide < DeviceConstants.maxMobileWidthForDeviceType ? DeviceType.mobile : DeviceType.tablet;
  }
}
