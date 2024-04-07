import 'package:chat_app/auth/login_or_register.dart';
import 'package:chat_app/themes/light_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginOrRegister(),
    theme: LightMode,
  ));
}

