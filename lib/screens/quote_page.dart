import 'dart:convert';
import 'package:flutter/material.dart';

import '../constants/theme.dart';
import '../widgets/quote_page/body.dart';

class QuotePageView extends StatefulWidget {
  final quotes;
  final index;
  final clickFavorite;
  const QuotePageView({
    super.key,
    required this.quotes,
    required this.index,
    required this.clickFavorite,
  });

  @override
  State<QuotePageView> createState() => _QuotePageViewState();
}

class _QuotePageViewState extends State<QuotePageView> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: PageView.builder(
          controller: _pageController,
          physics: ClampingScrollPhysics(),
          itemCount: widget.quotes.length,
          itemBuilder: (context, index) {
            return QuotePage(
              quote: widget.quotes[index],
              index: index,
              clickFavorite: widget.clickFavorite,
            );
          },
        ),
      ),
    );
  }
}

class QuotePage extends StatelessWidget {
  final quote;
  final clickFavorite;
  final index;
  QuotePage({
    required this.quote,
    required this.clickFavorite,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: bgs[quote['color_id']], // لون الخلفية
        appBar: AppBar(
          backgroundColor: bgs[quote['color_id']], // لون الخلفية
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: BodyQuotePage(clickFavorite: clickFavorite, quote: quote),
      ),
    );
  }
}
