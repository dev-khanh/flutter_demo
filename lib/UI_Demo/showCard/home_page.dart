import 'package:flutter/material.dart';
import 'package:flutterappexample/UI_Demo/showCard/card_widget.dart';
class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}
class HomePageState extends State<HomePage>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final orangeColor = Color(0xFFff9700);
  final orangeLightColor = Color(0xFFffc500);
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Stack(
        children: <Widget>[
          Theme(
            data: ThemeData(canvasColor: Colors.transparent),
            child: Container(
              width: 80,
              height: 150,
              child: Drawer(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: orangeColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                        ),
                      ),
                      width: 80,
                      height: 75,
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: orangeLightColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      height: 75,
                      width: 80,
                      child: Icon(
                        Icons.contact_phone,
                        color: Colors.white,
                        size: 32,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 42,
            top: -10,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
                size: 16,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
      body: Container(
        width: _media.width,
        height: _media.height,
        child: Stack(
          children: <Widget>[
            Container(
              child: Positioned(
                width: _media.width,
                height: 280,
                bottom: 0,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState.openEndDrawer();
                      },
                      child: Container(
                        child: CardListWidget(
                          foodDetail: "Desert - Fast Food - Alcohol",
                          foodName: "Cafe De Perks",
                          vote: 4.5,
                          foodTime: "15-30 min",
                          image: "https://3c1703fe8d.site.internapcdn.net/newman/gfx/news/hires/2016/howcuttingdo.jpg",
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                      },
                      child: CardListWidget(
                        foodDetail: "Desert - Fast Food - Alcohol",
                        foodName: "Cafe De Istanbul",
                        vote: 4.5,
                        foodTime: "15-60 min",
                        image: "https://asset2.cxnmarksandspencer.com/is/image/mands/44e79d5a6007d11fd420b6c302d0f2fc0ef404da",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
