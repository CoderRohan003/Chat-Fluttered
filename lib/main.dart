import 'dart:ffi';

import 'package:chat_app/auth/login_or_register.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/themes/light_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginOrRegister(),
    theme: LightMode,
  ));
}

