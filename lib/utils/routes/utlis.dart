import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class Utils {
  static toastSuccessMessage(String message, context) {
    MotionToast.success(
      height: 50,
      width: 250,
      animationDuration: const Duration(milliseconds: 1500),
      animationCurve: Curves.linearToEaseOut,
      animationType: AnimationType.fromBottom,
      // backgroundType: BackgroundType.transparent,
      // primaryColor: Colors.indigo.shade200,
      toastDuration: const Duration(seconds: 3),
      description: Text(message.toString()),
      enableAnimation: true,
      displayBorder: true,
    ).show(context);
  }

  static toastErrorMessage(String message, context) {
    MotionToast.error(
      height: 50,
      width: 250,
      animationDuration: const Duration(milliseconds: 1500),
      animationCurve: Curves.linearToEaseOut,
      animationType: AnimationType.fromBottom,
      // backgroundType: BackgroundType.transparent,
      // primaryColor: Colors.indigo.shade200,
      toastDuration: const Duration(seconds: 3),
      description: Text(message.toString()),
      enableAnimation: true,
      displayBorder: true,
    ).show(context);
  }

  static FlushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          // title: message,
          message: message,
          messageColor: Colors.black,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeInCubic,
          backgroundColor: Colors.teal.shade200,
          animationDuration: Duration(seconds: 1),
          duration: Duration(seconds: 3),
        )..show(context));
  }

  static snackBarMessage(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      ),
    );
  }
}
