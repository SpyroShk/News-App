import 'package:flutter/material.dart';

AppBar appbar() {
  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: 100,
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Fw',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xFF1F5753),
              fontSize: 25,
            ),
          ),
          TextSpan(
            text: 'News',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xFF403B36),
              fontSize: 25,
            ),
          ),
        ],
      ),
    ),
    centerTitle: true,
  );
}
