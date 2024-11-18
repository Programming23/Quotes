// ألوان واجهة الاقتباس
import 'package:flutter/material.dart';

const bgs = [
  Color(0xfffebf99),
  Color.fromARGB(255, 240, 124, 165),
  Color.fromARGB(255, 144, 164, 246),
  Color.fromARGB(255, 92, 148, 168),
  Color.fromARGB(255, 246, 205, 121),
  Color.fromARGB(255, 117, 192, 239),
  Color.fromARGB(255, 115, 228, 181),
  Color.fromARGB(255, 247, 157, 157),
  Color.fromARGB(255, 96, 183, 122),
  Color.fromARGB(255, 169, 144, 239),
];

// Theme

ThemeData theme = ThemeData(
  // الخط المستخدم في التطبيق
  fontFamily: 'main',
  // لون الخلفية المستخدمة في التطبيق
  scaffoldBackgroundColor: Color.fromARGB(246, 254, 254, 254),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: Colors.black, // لون النص
      fontSize: 22, // حجم الخط
      letterSpacing: 1, // المساف بين الحروف
      fontWeight: FontWeight.bold, // وزن الخط
    ),
    displayMedium: TextStyle(
      color: Colors.black,
      fontSize: 20, // حجم الخط
      letterSpacing: 1, // المساف بين الحروف
      fontWeight: FontWeight.bold, // وزن الخط
    ),
    // هذه هي إعدادات النص الخاصة ب الاقتباس
    bodyLarge: TextStyle(
      fontSize: 22.0, // حجم الخط
      color: Colors.white, // لون الخط
      fontWeight: FontWeight.bold, // وزن الخط
    ),
    // هذه هي إعدادات النص الخاصة ب مصدر الاقتباس
    labelMedium: TextStyle(
      fontSize: 18.0, // حجم الخط
      color: Colors.white, // لون الخط
      fontStyle: FontStyle.italic,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color.fromARGB(255, 240, 237, 237), // لون خلفية الشريط
    selectedItemColor: Colors.black, // لون العنصر المختار
    // لون نص العنصر المختار
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold, // وزن الخط
      letterSpacing: 0.6, // المساف بين الحروف
    ),
    // لون نص العنصر الغير مختار
    unselectedLabelStyle: TextStyle(
      fontWeight: FontWeight.w600, // وزن الخط
      letterSpacing: 0.4, // المساف بين الحروف
    ),
  ),
);
