import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';

import '../app/color_palette.dart';
import 'core_variable.dart';
import 'debouncer.dart';

class CoreFunction {
  static final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk

  static Debouncer debouncer = Debouncer(delay: const Duration(seconds: 1));

  static void logPrint(String tag, dynamic log) {
    if (CoreVariable.debug) {
      pattern
          .allMatches(tag + " => " + log.toString())
          .forEach((match) => debugPrint(match.group(0)));
    }
  }

  static Future<bool> checkConnectivity() async {
    bool connect = false;
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 10));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connect = true;
      }
    } on SocketException catch (_) {
      connect = false;
    }
    return connect;
  }


  static showToast(String message, {int duration = 3, int position = 1, Color backgroundColor = ColorPalette.red}) {
    // Flushbar(
    //   margin: const EdgeInsets.all(8),
    //   borderRadius: BorderRadius.circular(8),
    //   duration: Duration(seconds: duration),
    //   backgroundColor: backgroundColor,
    //   icon: const Icon(Icons.error_outline, color: ColorPalette.white),
    //   // message: message,
    //   messageText: Text(
    //     message,
    //     style: const TextStyle(
    //       color: ColorPalette.white,
    //       fontSize: 12
    //     ),
    //     maxLines: 3,
    //   ),
    // ).show(navGK.currentContext!);
  }

}
