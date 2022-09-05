import 'package:flutter/material.dart';
import 'constants.dart';

// Тема всего сайта
@override
ThemeData myTheme() => ThemeData(
      brightness: Brightness.light,
      primaryColor: kPrimaryColore,
      scaffoldBackgroundColor: kBackgroundColor,
      textTheme: const TextTheme(
        headline4: TextStyle(
          color: Colors.black,
        ),
        subtitle1: TextStyle(
          color: kTextColor,
        ),
        caption: TextStyle(
          color: Colors.black,
        ),
        bodyText1: TextStyle(
          fontSize: 20,
          height: 1.5,
        ),
      ),
    );
