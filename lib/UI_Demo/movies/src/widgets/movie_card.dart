import 'package:flutter/material.dart';
class MovieCard extends StatelessWidget {
  final String imagePath;
  final double imageScale;
  final String title;
  final String genres;
  MovieCard({this.imagePath, this.imageScale, this.title, this.genres});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.70,
      width: MediaQuery.of(context).size.width * 0.85,
      margin: EdgeInsets.all(2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: title,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(115, 115, 115, 1),
                    offset: Offset(0.0, 30.0),
                    blurRadius: 20.0
                  ),
                ]
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Transform.scale(
                  scale: imageScale,
                  child: Image.asset(
                    '$imagePath',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.50,
                    width: MediaQuery.of(context).size.width * 0.65,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 55,),
          Text(
            '$title',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,

            ),
            textAlign: TextAlign.center,
          ),
          Text(
            '$genres',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey
            ),
          ),
        ],
      ),
    );
  }
}
