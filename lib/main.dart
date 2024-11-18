// تم استيراد المكتبات المطلوبة
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quotes/constants/texts.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// تم استيراد الملفات المطلوبة
import 'constants/quotes_data.dart';
import 'constants/theme.dart';
import 'screens/about_us.dart';
import 'screens/loading_page.dart';
import 'screens/page.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // التأكد من تهيئة التطبيق بشكل صحيح
  SharedPreferences prefs = await SharedPreferences
      .getInstance(); // تم إنشاء متغير من نوع SharedPreferences لحفظ المفضلة
  runApp(MyApp(
    prefs: prefs,
  ));
}

class MyApp extends StatefulWidget {
  final prefs;
  MyApp({
    required this.prefs,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List quotes = []; // تم إنشاء قائمة الاقتباسات
  int _currentIndex = 0; // تم إنشاء متغير لتحديد المؤشر الحالي
  Map favs = {}; // تم إنشاء متغير لحفظ المفضلة
  List favorites = []; // تم إنشاء قائمة المفضلة
  int currentIndex = 0;
  bool? fetchedData = null;

  @override
  void initState() {
    initStorage();
    // إذا أردت جلب الاقتباسات عن طريق API فيجب عليك العمل بهده الدالة و جعل السطر الخاص بدالة _getQuotesData تعليق
    // _fetchQuotes();
    _getQuotesData();

    super.initState();
  }

  // تم إنشاء دالة initStorage لتهيئة المفضلة
  void initStorage() async {
    try {
      favs = json.decode(widget.prefs.getString('favorites') as String)
          as Map; // تم قراءة المفضلة من الذاكرة المؤقتة وتحويلها إلى Map
    } catch (e) {
      widget.prefs.setString(
        'favorites',
        json.encode({}),
      );
    }
  }

  // تم إنشاء دالة _fetchQuotes لجلب الاقتباسات من API
  _fetchQuotes() async {
    setState(() {
      fetchedData = false;
    });
    final response = await http.get(Uri.parse('http://127.0.0.1:5000/'));
    if (response.statusCode == 200) {
      setState(() {
        quotes = List.from(json.decode(response
            .body)); // تم تحويل البيانات المجيبة إلى List وتخزينها في قائمة الاقتباسات
      });
    }

    initFavorites();
    setState(() {
      fetchedData = true;
    });
  }

  initFavorites() {
    for (int i = 0; i < quotes.length; i++) {
      quotes[i]['index'] = i;
      if (favs.containsKey(quotes[i]['id'].toString())) {
        setState(() {
          quotes[i]['favorite'] = true;
          favorites.add(quotes[i]);
        });
      } else {
        setState(() {
          quotes[i]['favorite'] = false;
        });
      }
    }
  }

// تم إنشاء دالة _getQuotesData لمعالجة بيانات الاقتباسات
  _getQuotesData() {
    setState(() {
      quotes = quotes_data;
    });
    initFavorites();
  }

  changeCurrentIndex(new_index) {
    setState(() {
      currentIndex = new_index;
    });
  }

  clickFavorite(index) {
    if (quotes[index]['favorite'] == true) {
      setState(() {
        favorites.remove(quotes[index]);
        favs.remove(quotes[index]['id'].toString());
        quotes[index]['favorite'] = false;
      });
    } else {
      setState(() {
        favorites.insert(0, quotes[index]);
        favs[quotes[index]['id'].toString()] = null;
        quotes[index]['favorite'] = true;
      });
    }
    widget.prefs.setString('favorites', json.encode(favs));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: theme,
      initialRoute: '/loading',
      onGenerateRoute: (route) {
        if (route.name == '/loading') {
          return MaterialPageRoute(builder: (context) => LoadingPage());
        } else if (route.name == '/') {
          return MaterialPageRoute(
              builder: (context) => MainPage(
                    title: title,
                    prefs: widget.prefs,
                    second_title: second_title_home,
                    clickFavorite: clickFavorite,
                    quotes: quotes,
                    changeIndex: changeCurrentIndex,
                    currentIndex: currentIndex,
                    fetchedData: fetchedData,
                  ));
        } else if (route.name == '/favorites') {
          return MaterialPageRoute(
              builder: (context) => MainPage(
                    title: title,
                    prefs: widget.prefs,
                    second_title: second_title_favorites,
                    clickFavorite: clickFavorite,
                    quotes: favorites,
                    changeIndex: changeCurrentIndex,
                    currentIndex: currentIndex,
                    fetchedData: fetchedData,
                  ));
        } else if (route.name == '/about_us') {
          return MaterialPageRoute(
              builder: (context) => AboutUs(
                    changeIndex: changeCurrentIndex,
                    currentIndex: currentIndex,
                  ));
        }
      },
    );
  }
}
