import 'package:flutter/material.dart';

import '../../constants/texts.dart';

class AboutUsText extends StatelessWidget {
  const AboutUsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      aboutUstext,
      style: TextStyle(
        fontSize: 12, // حجم الخط
        fontWeight: FontWeight.w500, // وزن الخط
        letterSpacing: 0.3, // الميافة بين الحروف
      ),
    );
  }
}
