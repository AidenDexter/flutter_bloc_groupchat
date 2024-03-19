import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'common/service/storage_service.dart';

class Global {
  static late StorageService storageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Platform.isAndroid
        ? await Firebase.initializeApp(
            options: const FirebaseOptions(
            apiKey: 'AIzaSyARb8oiTgFsMAqKoOmd-m7nGhRA0ogMvPk',
            appId: '1:904864871255:android:495b43edc89db3dd6c8412',
            messagingSenderId: '904864871255',
            projectId: 'flutter-bloc-groupchat',
          ))
        : await Firebase.initializeApp();

    await Firebase.initializeApp();
    storageService = await StorageService().init();
  }
}
