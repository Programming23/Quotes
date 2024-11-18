import '../widgets/page/body.dart';
import 'package:flutter/material.dart';
import '../widgets/navigation.dart';

class MainPage extends StatelessWidget {
  final prefs;
  final title;
  final second_title;
  final quotes;
  final clickFavorite;
  final currentIndex;
  final changeIndex;
  final fetchedData;

  const MainPage({
    super.key,
    required this.prefs,
    required this.second_title,
    required this.title,
    required this.clickFavorite,
    required this.quotes,
    required this.changeIndex,
    required this.currentIndex,
    required this.fetchedData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(
        clickFavorite: clickFavorite,
        quotes: quotes,
        title: title,
        second_title: second_title,
        fetchedData: fetchedData,
      ),
      bottomNavigationBar: BottomNavigation(
        changeIndex: changeIndex,
        currentIndex: currentIndex,
      ),
    );
  }
}
