import 'package:facebook_interface/screens/main.dart';
import 'package:facebook_interface/utilities/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ),
  );

  runApp(
    MaterialApp(
      title: "Facebook",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorPalettle.SCAFFOLD,
      ),
      home: Main(),
    ),
  );
}
