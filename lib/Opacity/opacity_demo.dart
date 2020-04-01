import 'package:flutter/material.dart';

class OpacityDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFEFEFE),
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Color(0xFFFEFEFE),
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  _buildComposer(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildComposer(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top: 64, left: 32, right: 32),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                offset: const Offset(4, 4),
                blurRadius: 8),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: const EdgeInsets.all(4.0),
            constraints: const BoxConstraints(minHeight: 80, maxHeight: 160),
            color: Colors.white,
            child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 100, right: 10, top: 50, bottom: 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: const Card(child: Text('ssssssssssss')),
                )
            ),
          ),
        ),
      ),
    );
  }
}