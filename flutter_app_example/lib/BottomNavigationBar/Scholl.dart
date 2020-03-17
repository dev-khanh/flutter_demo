import 'package:flutter/material.dart';

class Scholl extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var card = new Card(
      child: new Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.account_box, color: Colors.blue, size: 26.0,),
            title: Text("Duong Quoc Khanh", style: TextStyle(fontWeight: FontWeight.w400)),
            subtitle: Text('Deverlop'),
          ),
          Divider(color: Colors.blue, indent: 16.0),
          ListTile(
            leading: Icon(Icons.email, color: Colors.blue, size: 26.0),
            title: Text('devdqkhanh@gmail.com', style: TextStyle(fontWeight: FontWeight.w400)),
          ),
          ListTile(
            leading: Icon(Icons.phone, color: Colors.blue, size: 26.0),
            title: Text('+84 44 34 1900', style: TextStyle(fontWeight: FontWeight.w400)),
          )
        ],
      ),
    );
    final sizeBox = new Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0),
        child: SizedBox(
          height: 220.0,
          child: card,
        ),
    );
    final cardview = new Container(
      padding: new EdgeInsets.only(left: 0.0, bottom: 8.0, right: 16.0),
      decoration: new BoxDecoration(color: Colors.blue),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('0.00', style: TextStyle(color: Colors.red, fontSize: 50.0, fontWeight: FontWeight.bold)),
          Text('Current Balance', style: TextStyle(color: Colors.yellow, fontSize: 26.0, fontWeight: FontWeight.bold)),
          new Card(
            child: new Column(
              children: <Widget>[
                new Image.network('https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg'),
                new Padding(
                    padding: new EdgeInsets.all(7.0),
                    child: new Row(
                      children: <Widget>[
                        new Padding(padding: new EdgeInsets.all(7.0), child: new Icon(Icons.thumb_up)),
                        new Padding(padding: new EdgeInsets.all(7.0), child: new Text('Like', style: new TextStyle(fontSize: 18.0))),
                        new Padding(padding: new EdgeInsets.all(7.0), child: new Icon(Icons.comment)),
                        new Padding(padding: new EdgeInsets.all(7.0), child: new Text('Comments', style: new TextStyle(fontSize: 18.0)))
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
//    return Scaffold(body: sizeBox);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          sizeBox,
          cardview
        ],
      ),
    );
  }
}