import 'package:flutter/material.dart';

class Desiges_example extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MyHomePage1()
    );
  }
  Widget _BoderRadisuccssss2(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 30.0),
        child: Text('Duong Quoc Khanh')
      )
    );
  }
  Widget _BoderRadisuccssss1(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.deepOrange,
      ),
    );
  }
  Widget _BoderRadisuccssss(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Expanded(
            child: _rowOne(context),
            flex: 1,
          ),
          Expanded(
            child: _rowTwo(context),
            flex: 1,
          ),
          Expanded(
            child: _rowThere(context),
            flex: 1,
          ),
        ],
      )
    );
  }
  Widget _rowOne(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(child: Text('Duong Quoc Khanh')),
    );
  }
  Widget _rowTwo(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
  Widget _rowThere(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.grey),
    );
  }


  final _startSligment = Row /*or Column*/(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Icon(Icons.star, size: 50),
      Icon(Icons.star, size: 50),
      Icon(Icons.star, size: 50),
    ],
  );

  final _centerAlignment = Row /*or Column*/(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(Icons.star, size: 50),
      Icon(Icons.star, size: 50),
      Icon(Icons.star, size: 50),
    ],
  );

  final _canDieuAligment = Row /*or Column*/(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Icon(Icons.star, size: 50),
      Icon(Icons.star, size: 50),
      Icon(Icons.star, size: 50),
    ],
  );



  final _canDieuPadding = Row /*or Column*/(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Icon(Icons.star, size: 50),
      Icon(Icons.star, size: 50),
      Icon(Icons.star, size: 50),
    ],
  );


  final _minMax = Row /*or Column*/(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Icon(Icons.star, size: 50),
      Icon(Icons.star, size: 50),
      Icon(Icons.star, size: 50),
    ],
  );



  final _buttonCanDieu = Center(
    child: IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {},
            child: Text('Short'),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('A bit Longer'),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('The Longest text button'),
          ),
        ],
      ),
    ),
  );



  final _stackViews = Stack(
    fit: StackFit.expand,
    children: <Widget>[
      Material(color: Colors.yellowAccent),
      Positioned(
        top: 0,
        left: 0,
        child: Icon(Icons.star, size: 50),
      ),
      Positioned(
        top: 340,
        left: 250,
        child: Icon(Icons.call, size: 50),
      ),
    ],
  );


  final _boderVuong = Center(
    child: Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.yellow,
        border: Border.all(color: Colors.black, width: 3),
      ),
    ),
  );


  final _BoderRadisucc = Center(
    child: Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.yellow,
        border: Border.all(color: Colors.black, width: 3),
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
    ),
  );





  final _boderHinhTron = Center(
    child: Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.yellow,
        shape: BoxShape.circle,
      ),
    ),
  );




  final _boxShowdaw = Center(
    child: Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.yellow,
        boxShadow: const [
          BoxShadow(blurRadius: 10),
        ],
      ),
    ),
  );



  final _ColorCSS3 = Center(
    child: Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [
            Colors.red,
            Colors.blue,
          ],
        ),
      ),
    ),
  );




  final _vuong7Mau = Center(
    child: Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        gradient: SweepGradient(
          colors: const [
            Colors.blue,
            Colors.green,
            Colors.yellow,
            Colors.red,
            Colors.blue,
          ],
          stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
        ),
      ),
    ),
  );



  final _VuongBoder = Center(
    child: Material(
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        side: BorderSide(color: Colors.black, width: 4),
      ),
      color: Colors.yellow,
      child: Container(
        height: 200,
        width: 200,
      ),
    ),
  );



  final _ListTile  = CustomScrollView(
    slivers: [
      SliverList(
        delegate: SliverChildListDelegate(const [
          ListTile(title: Text('First item')),
          ListTile(title: Text('Second item')),
          ListTile(title: Text('Third item')),
          ListTile(title: Text('Fourth item')),
        ]),
      ),
      SliverFillRemaining(
        hasScrollBody: false,
        child: Container(
          color: Colors.yellowAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FlutterLogo(size: 200),
              Text(
                'This is some longest text that should be centered'
                    'together with the logo',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ],
  );


  final _endAlignment = Row /*or Column*/(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      Icon(Icons.star, size: 50),
      Icon(Icons.star, size: 50),
      Icon(Icons.star, size: 50),
    ],
  );


  final _widgets = Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 0.0),
            child: Text('Duong Quoc Khanh'),
          ),

        ]
      )
  );
}
class _mCandieuPaddiing extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text(
          'Baseline',
          style: Theme.of(context).textTheme.display3,
        ),
        Text(
          'Baseline',
          style: Theme.of(context).textTheme.body1,
        ),
      ],
    );
  }
}


class _CanDieuFullScreenCenter extends StatelessWidget{
  var iconSize = 50;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stack with LayoutBuilder')),
      body: LayoutBuilder(
        builder: (context, constraints) =>
            Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Material(color: Colors.yellowAccent),
                Positioned(top: 0, child: Icon(Icons.star, size: 50)),
                Positioned(top: constraints.maxHeight - iconSize, left: constraints.maxWidth - iconSize,
                  child: Icon(Icons.call, size: 50),
                ),
                Positioned(child: Icon(Icons.clear, size: 50,), top: 0, right: 0,),
                Positioned(child: Icon(Icons.done, size: 50,), top: constraints.maxHeight - iconSize,)
              ],
            ),
      ),
    );
  }
}
class _PositionIcon extends StatelessWidget{
  var iconSize = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Position')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(decoration: BoxDecoration(color: Colors.red),),
            flex: 1,
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) =>
                  Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Material(color: Colors.yellowAccent),
                      Positioned(top: -20, child: Icon(Icons.star, size: 50)),
                      Positioned(top: constraints.maxHeight - iconSize, left: constraints.maxWidth - iconSize,
                        child: Icon(Icons.call, size: 50),
                      ),
                      Positioned(child: Icon(Icons.clear, size: 50,), top: 0, right: 0,),
                      Positioned(child: Icon(Icons.done, size: 50,), top: constraints.maxHeight - iconSize,)
                    ],
                  ),
            ),
            flex: 1,
          ),
        ],
      )
    );
  }
}



class MyHomePage1 extends StatelessWidget {
  final double topWidgetHeight = 200.0;
  final double avatarRadius = 50.0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Column(
            children: <Widget>[
              Expanded(child: Container(decoration: BoxDecoration(color: Colors.red)), flex: 1,),
              Expanded(child: Container(decoration: BoxDecoration(color: Colors.yellow)), flex: 2),
            ],
          ),
          new Positioned(
            child: new CircleAvatar(
              radius: avatarRadius,
              backgroundColor: Colors.green,
            ),
            left: (MediaQuery.of(context).size.width/2) - avatarRadius,
            top: topWidgetHeight - avatarRadius,
          )
        ],
      ),
    );
  }
}
class MyHomePage extends StatelessWidget {
  final double avatarRadius = 50.0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 3.8;
    var width = MediaQuery.of(context).size.width;
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(height: height, color: Colors.yellow),
            ],
          ),
          Positioned(
            child: CircleAvatar(radius: avatarRadius, backgroundColor: Colors.green),
            left: (MediaQuery.of(context).size.width/2) - avatarRadius,
            top: height - avatarRadius,
          )
        ],
      ),
    );
  }
}
