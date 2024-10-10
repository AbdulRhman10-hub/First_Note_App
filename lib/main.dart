import 'package:first_note_app/HiveHelpers.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'MyApp.dart';

void main()async {
  await Hive.initFlutter();
  var box = await Hive.openBox(HiveHelpers.notesBox);
  await HiveHelpers.getAllNotes();  // get all notes before running the app

  runApp(const MyApp());
}

