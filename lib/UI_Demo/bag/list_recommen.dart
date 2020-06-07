import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappexample/UI_Demo/bag/cook_details_page.dart';
class ListRecommen extends StatefulWidget {
  @override
  TodayStoryTabPageState createState() {
    return TodayStoryTabPageState();
  }
}
class TodayStoryTabPageState extends State<ListRecommen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Recommended',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 250,
              width: double.infinity,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: ((BuildContext context, int index) {
                  if (0 == index || 19 == index) {
                    return VerticalDivider(
                      width: 10,
                      color: Colors.transparent,
                    );
                  } else {
                    return GestureDetector(
                      child: getRecommendedItemView(index),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CookDetailsPage('assets/images/bag/10.jpg')));
                      },
                    );
                  }
                }),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                separatorBuilder: ((BuildContext context, int index) {
                  return VerticalDivider(
                    width: 10,
                    color: Colors.transparent,
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget getRecommendedItemView(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            child: Image(
              image: AssetImage("assets/images/bag/${index * 5 % 11}.jpg"),
            ),
          ),
          flex: 1,
        ),
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: Text(
            'The cheeses guide',
            maxLines: 1,
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            'Best dishes to enjoy them.',
            maxLines: 1,
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.star,
                size: 15,
                color: Colors.red[500],
              ),
              Icon(
                Icons.star,
                size: 15,
                color: Colors.red[500],
              ),
              Icon(
                Icons.star,
                size: 15,
                color: Colors.red[500],
              ),
              Icon(
                Icons.star,
                size: 15,
                color: Colors.red[500],
              ),
              Icon(
                Icons.star,
                size: 15,
                color: Colors.grey[500],
              ),
            ],
          ),
        )
      ],
    );
  }
}
