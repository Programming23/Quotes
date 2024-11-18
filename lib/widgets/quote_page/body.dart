import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BodyQuotePage extends StatefulWidget {
  final quote;
  final clickFavorite;
  const BodyQuotePage({
    super.key,
    required this.clickFavorite,
    required this.quote,
  });

  @override
  State<BodyQuotePage> createState() => _BodyQuotePageState();
}

class _BodyQuotePageState extends State<BodyQuotePage> {
  @override
  Widget build(BuildContext context) {
    String author = widget.quote["author"];
    bool fav = widget.quote['favorite'] == true;
    return Padding(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ايقونة الاقتباس التي توجد في اقصى اليمين
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.format_quote, size: 50),
                  ),
                  Center(
                    child: Text(
                      widget.quote['quote'], // الاقتباس
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            // عند الضغط على أيقونة "النسخ" ستظهر رسالة "تم النسخ"
                            onPressed: () {
                              Clipboard.setData(
                                  ClipboardData(text: widget.quote['quote']));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  'تم النسخ',
                                  textAlign: TextAlign.center,
                                ),
                              ));
                            },
                            icon: Icon(
                              Icons.copy, // الايقونة
                              size: 40, // حجم الايقونة
                            ),
                          ),
                          // المسافة بين الايقونات
                          SizedBox(
                            width: 30,
                          ),
                          // الواجهة الخاصة بأيقونة "المفصلة"
                          IconButton(
                            // الدالة الخاصة بالضغط على الايقونة
                            onPressed: () {
                              setState(() {
                                widget.clickFavorite(widget.quote['index']);
                              });
                              if (fav) {
                                Navigator.pop(context);
                              }
                            },
                            icon: Icon(
                              fav
                                  ? Icons.favorite
                                  : Icons.favorite_border, // الايقونة
                              size: 40, // حجم الايقونة
                              color: fav ? Colors.red : null, // لون الايقونة
                            ),
                          ),
                        ],
                      ),
                      // المسافة بين الواجهات
                      SizedBox(
                        height: 25,
                      ),
                      // ايقونة الاقتباس التي توجد في اقصى اليسار
                      Align(
                        alignment: Alignment.topLeft,
                        child: Icon(
                          Icons.format_quote, // الايقونة
                          size: 50, // حجم الايقونة
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // المسافة بين الواجهات
            SizedBox(
              height: 30,
            ),
            // النص الخاص ب مصدر الاقتباس
            Text(
              '- $author -', // مصدر الاقتباس
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
