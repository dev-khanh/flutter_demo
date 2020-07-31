import 'package:flutter/material.dart';
import 'package:flutterappexample/UI_Demo/movies/src/models/actor_model.dart';
class CastingActorCard extends StatelessWidget {
  final ActorModel actor;
  CastingActorCard({this.actor});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 5.0,
                  blurRadius: 5
                )
              ]
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                '${actor.imagePath}',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width * 0.30,
              ),
            ),
          ),
          SizedBox(height: 25,),
          Text(
            '${actor.actorName.toUpperCase()}',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            '${actor.characterName.toUpperCase()}',
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey
            ),
          )
        ],
      ),
    );
  }
}
