import 'package:flutter/material.dart';
import 'package:quotes/constants/theme.dart';
import 'quote.dart';

class HomeBody extends StatelessWidget {
  final quotes;
  final title;
  final second_title;
  final clickFavorite;
  final fetchedData;
  const HomeBody({
    super.key,
    required this.clickFavorite,
    required this.quotes,
    required this.second_title,
    required this.title,
    required this.fetchedData,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      // هذه هي الواجهة الهاصة بالاقتباسات
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15), // الحشو
        children: [
          Text(
            title, // اسم التطبيق . يمكنك تغييره باتباع الخطوات الموضحة في التوثيق
            textDirection: TextDirection.rtl, // اتجاه النص
            textAlign: TextAlign.center, // مكلن النص
            style: Theme.of(context)
                .textTheme
                .displayLarge, // الاعدادات الخاصة بهذا النوع من النصوص . يمكنك تغييره في المكان الخاص بالوصع (theme)
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            second_title,
            textDirection: TextDirection.rtl, // اتجاه النص
            style: Theme.of(context)
                .textTheme
                .displayMedium, // الاعدادات الخاصة بهذا النوع من النصوص . يمكنك تغييره في المكان الخاص بالوصع (theme)
          ),
          // نضيف هذه الواجهة من اجل وجود مسافة بين الواجهات
          SizedBox(
            height: 10,
          ),
          if (fetchedData == null || fetchedData == true)
            for (int i = 0; i < quotes.length; i++)
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    color: bgs[quotes[i]['color_id']],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 81, 78, 78).withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ]),
                padding: EdgeInsets.all(15),
                child: QuotePart(
                  quotes: quotes,
                  i: i,
                  clickFavorite: clickFavorite,
                ), // هذه هي الواجهة الخاصة بالاقتباس
              )
          else
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Center(child: CircularProgressIndicator()),
            )
        ],
      ),
    );
  }
}
