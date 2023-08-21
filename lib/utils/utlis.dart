import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class Utils {
  static toastSuccessMessage(String message, context) {
    MotionToast.success(
      height: 60,
      width: 250,
      position: MotionToastPosition.top,
      animationCurve: Curves.linearToEaseOut,
      animationType: AnimationType.fromBottom,
      toastDuration: const Duration(seconds: 1),
      description: Text(message.toString()),
      enableAnimation: true,
      displayBorder: true,
    ).show(context);
  }

  static toastErrorMessage(String message, context) {
    MotionToast.error(
      height: 60,
      width: 250,
      animationDuration: const Duration(milliseconds: 1500),
      animationCurve: Curves.linearToEaseOut,
      animationType: AnimationType.fromBottom,
      position: MotionToastPosition.top,
      toastDuration: const Duration(seconds: 3),
      description: Text(message.toString()),
      enableAnimation: true,
      displayBorder: true,
    ).show(context);
  }

  static flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          messageColor: Colors.black,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeInCubic,
          backgroundColor: Colors.teal.shade200,
          animationDuration: const Duration(seconds: 1),
          duration: const Duration(seconds: 3),
        )..show(context));
  }

  static snackBarMessage(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        behavior: SnackBarBehavior.floating,
        elevation: 10,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        backgroundColor: Colors.red,
        content: Text(message),
      ),
    );
  }
}
