import 'package:flutter/material.dart';

class LoginImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
