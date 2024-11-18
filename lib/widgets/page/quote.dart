import 'package:flutter/material.dart';
import '../../screens/quote_page.dart';

class QuotePart extends StatelessWidget {
  const QuotePart({
    super.key,
    required this.quotes,
    required this.i,
    required this.clickFavorite,
  });

  final quotes;
  final int i;
  final clickFavorite;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // عند الضغط على الاقتباس يتم نقلك الى الصفحة الخاصة بالاقتباس
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuotePageView(
                quotes: quotes, index: i, clickFavorite: clickFavorite),
          ),
        );
      },
      title: Center(
        child: Text(
          quotes[i]['quote'], // الاقتباس
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center, // مكان الخط
          style: TextStyle(
            fontSize: 16, // حجم الخط
            color: Colors.white, // لون الخط
          ),
        ),
      ),
    );
  }
}
