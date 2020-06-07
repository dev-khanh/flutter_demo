import 'package:flutter/material.dart';
import 'hotel_app_theme.dart';
import 'hotel_list_data.dart';
import 'hotel_list_view.dart';

class Main_List extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HotelHomeScreen(),);
  }
}
class HotelHomeScreen extends StatefulWidget {
  @override
  _HotelHomeScreenState createState() => _HotelHomeScreenState();
}
class _HotelHomeScreenState extends State<HotelHomeScreen> with TickerProviderStateMixin {
  AnimationController animationController;
  List<HotelListData> hotelList = HotelListData.hotelList;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));
  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }
  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: HotelAppTheme.buildLightTheme(),
      child: Container(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
               Container(
                color:
                HotelAppTheme.buildLightTheme().backgroundColor,
                child: ListView.builder(
                  itemCount: hotelList.length,
                  padding: const EdgeInsets.only(top: 8),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    final int count = hotelList.length > 10 ? 10 : hotelList.length;
                    final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(parent: animationController, curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn))
                    );
                    animationController.forward();
                    return HotelListView(callback: () {}, hotelData: hotelList[index], animation: animation, animationController: animationController);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


