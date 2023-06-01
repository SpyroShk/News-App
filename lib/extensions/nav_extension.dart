import 'package:flutter/material.dart';

extension NavExtension on BuildContext {
  void push(Widget screen) {
    Navigator.of(this).push(
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  // void pop() {
  //   Navigator.of(this).pop();
  // }

  // void pushReplacement(Widget screen) {
  //   Navigator.of(this).pushReplacement(
  //     MaterialPageRoute(builder: (context) => screen),
  //   );
  // }
}
