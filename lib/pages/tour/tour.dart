import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sorucevap/constants/colors.dart';

class TourPage extends StatelessWidget {
  PageController _pageController;

  @override
  Widget build(BuildContext context) {
    _pageController = new PageController();
    return Scaffold(
      body: SafeArea(
        child: PageView(

          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          children: <Widget>[tourOne(), tourTwo(), tourThree(context)],
        ),
      ),
    );
  }

  Widget tourOne() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
            flex: 2,
            child: SvgPicture.asset(
              "assets/svg/searching.svg",
              placeholderBuilder: (BuildContext context) => Container(padding: const EdgeInsets.all(30.0), child: const CircularProgressIndicator()),
            )),
        Flexible(
          child: Text(
            "Birinci Aşama",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(right: 50, left: 50),
            child: Text(
              "Lorem ipsum dolar sit amet dolar ipsum dolar amet dolar ipsum dolar amet dolar ipsum dolar",
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                gradient:
                    LinearGradient(colors: [Color(0xffFF63A4), Color(0xffFF8962)], begin: Alignment.centerLeft, end: Alignment.centerRight)),
            child: Center(
              child: Container(
                width: 200,
                child: OutlineButton(
                  borderSide: BorderSide(color: Colors.white),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                  textColor: Colors.white,
                  onPressed: () => {_pageController.nextPage( duration: Duration(milliseconds: 800), curve:Curves.ease)},
                  child: Text("Devam"),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget tourTwo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Icon(
            Icons.search,
            size: 200,
            color: AppColors.orange[600],
          ),
        ),
        Flexible(
          child: Text(
            "İkinci Aşama",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(right: 50, left: 50),
            child: Text(
              "Lorem ipsum dolar sit amet dolar ipsum dolar amet dolar ipsum dolar amet dolar ipsum dolar",
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                gradient:
                LinearGradient(colors: [Color(0xffFF63A4), Color(0xffFF8962)], begin: Alignment.centerLeft, end: Alignment.centerRight)),
            child: Center(
              child: Container(
                width: 200,
                child: OutlineButton(
                  borderSide: BorderSide(color: Colors.white),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                  textColor: Colors.white,
                  onPressed: () => {_pageController.animateToPage(2, duration: Duration(milliseconds: 800), curve: Curves.easeInOut)},
                  child: Text("Devam"),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget tourThree(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Icon(
            Icons.search,
            size: 200,
            color: AppColors.orange[600],
          ),
        ),
        Flexible(
          child: Text(
            "Üçüncü Aşama",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(right: 50, left: 50),
            child: Text(
              "Lorem ipsum dolar sit amet dolar ipsum dolar amet dolar ipsum dolar amet dolar ipsum dolar",
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                gradient:
                LinearGradient(colors: [Color(0xffFF63A4), Color(0xffFF8962)], begin: Alignment.centerLeft, end: Alignment.centerRight)),
            child: Center(
              child: Container(
                width: 200,
                child: OutlineButton(
                  borderSide: BorderSide(color: Colors.white),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                  textColor: Colors.white,
                  onPressed: () => {Navigator.of(context).pop()},
                  child: Text("Bitir"),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
