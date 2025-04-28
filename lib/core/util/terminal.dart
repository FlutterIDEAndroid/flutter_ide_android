import 'package:flutter/services.dart';

class TerminalUtil {
  static const platform = MethodChannel('flutter_ide_android');
  Future<String> getUsrPath() async {
    try {
      final path = await platform.invokeMethod('getUsrPath');
      return path;
    } catch (e) {
      print("Error getting app data path: $e");
      return "";
    }
  }

  Future<String> getBinPath() async {
    try {
      final path = await platform.invokeMethod('getBinPath');
      return path;
    } catch (e) {
      print("Error getting app data path: $e");
      return "";
    }
  }

  Future<String> getLibPath() async {
    try {
      final path = await platform.invokeMethod('getLibPath');
      return path;
    } catch (e) {
      print("Error getting app data path: $e");
      return "";
    }
  }

  Future<String> getHomePath() async {
    try {
      final path = await platform.invokeMethod('getHomePath');
      return path;
    } catch (e) {
      print("Error getting app data path: $e");
      return "";
    }
  }
}
