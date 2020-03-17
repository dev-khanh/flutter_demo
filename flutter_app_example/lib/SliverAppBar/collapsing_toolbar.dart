import 'package:flutter/material.dart';
class Collapsing_Toolbar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: 150.0,
            floating: true,
            pinned: true, // false or true an hoac hien
            flexibleSpace: new FlexibleSpaceBar(title: Text('Slider App Bar')),
          ),
          new SliverList(delegate: new SliverChildBuilderDelegate((context, index) => new ListTile(title: new Text('List item $index'))))
        ],
      ),
    );
  }
}