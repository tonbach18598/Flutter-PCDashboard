import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class Toasts {
  static showSuccessToast(String message) {
    showToast(
      message,
      duration: Duration(seconds: 2),
      position: ToastPosition.center,
      backgroundColor: Colors.green.withOpacity(0.8),
      radius: 30.0,
      textPadding: EdgeInsets.all(15),
      textStyle: TextStyle(color: Colors.white, fontSize: 16),
    );
  }

  static showFailureToast(String message) {
    showToast(
      message,
      duration: Duration(seconds: 2),
      position: ToastPosition.center,
      backgroundColor: Colors.red.withOpacity(0.8),
      radius: 30.0,
      textPadding: EdgeInsets.all(15),
      textStyle: TextStyle(color: Colors.white, fontSize: 16),
    );
  }

  static showWarningToast(String message) {
    showToast(
      message,
      duration: Duration(seconds: 2),
      position: ToastPosition.center,
      backgroundColor: Colors.amber,
      radius: 30.0,
      textPadding: EdgeInsets.all(15),
      textStyle: TextStyle(color: Colors.white, fontSize: 16),
    );
  }
}
