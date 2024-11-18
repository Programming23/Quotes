// هذا الكلاس يعمل على عرض شريط التنقل السفلي للتطبيق
// يستقبل معلومات currentIndex و changeIndex لتحديد الصفحة وتغييرها عند النقر على صفحة مختلفة
import 'package:flutter/material.dart';

import '../constants/texts.dart';

class BottomNavigation extends StatelessWidget {
  final currentIndex;
  final changeIndex;
  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.changeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BottomNavigationBar(
        // نوع الشريط
        type: BottomNavigationBarType.fixed,
        // الصفحة الحالية في الشريط
        currentIndex: currentIndex,

        elevation: 100,
        onTap: (value) {
          // استجابة للنقر على العنصر
          if (value != currentIndex) {
            // تغيير الصفحة
            changeIndex(value);
            // تحديد الصفحة المطلوبة
            if (value == 0) {
              // الذهاب الى الصفحة الرئيسية
              Navigator.pushReplacementNamed(context, '/');
            } else if (value == 1) {
              // الذهاب الى صفحة الاقتباسات المفضلة
              Navigator.pushReplacementNamed(context, '/favorites');
            } else if (value == 2) {
              // الذهاب الى صفحة حولنا
              Navigator.pushReplacementNamed(context, '/about_us');
            }
          }
        },
        // عناصر الشريط
        items: [
          BottomNavigationBarItem(
            label: first_nav,
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: middle_nav,
            icon: Icon(Icons.music_note),
          ),
          BottomNavigationBarItem(
            label: last_nav,
            icon: Icon(Icons.location_on),
          ),
        ],
      ),
    );
  }
}
