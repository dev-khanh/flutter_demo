import 'package:flutter/material.dart';
import 'package:flutterappexample/UI_Demo/movies/src/models/actor_model.dart';
import 'package:flutterappexample/UI_Demo/movies/src/models/movie_model.dart';
import 'package:flutterappexample/UI_Demo/movies/src/widgets/casting_actor_card.dart';
import 'booking_screen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class MovieDetails extends StatelessWidget {
  final MovieModel currentMovie;

  final double smallFontSize = 10.0;
  final double bigFontSize = 25.0;

  MovieDetails({this.currentMovie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => BookingScreen(currentMovie: currentMovie,))
                  );
                },
                child: Container(
                  height:MediaQuery.of(context).size.height * 0.5,
                  width: double.infinity,
                  child: Hero(
                    tag: currentMovie.title,
                    child: ShaderMask(
                      child: Image.asset(
                        '${currentMovie.imagePath}',
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                      shaderCallback: (Rect bounds){
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          // colors: [
                          //   const Color(0x20FFFFFF),
                          //   Colors.white
                          // ],
                          // stops: [0.0, 0.85]
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.srcATop,
                    ),
                  ),
                ),
              ),
//              Container(
//                height: MediaQuery.of(context).size.height * 0.5,
//                width: double.infinity,
//                decoration: BoxDecoration(
//                  gradient: LinearGradient(
//                    begin: Alignment.topCenter,
//                    end: Alignment.bottomCenter,
//                    colors: [
//                      const Color(0x00000000),
//                      const Color(0x20FFFFFF),
//                      const Color(0xAAFFFFFF),
//                      const Color(0xFFFFFFFF),
//                    ],
//                  ),
//                ),
//              ),
              Positioned(
                bottom: 40,
                left: 20,
                child: Text(
                  '${currentMovie.title.toUpperCase()}',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight:FontWeight.bold,
                    letterSpacing: 1.2
                  ),
                )
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: FlutterRatingBarIndicator(
                  itemSize: 15,
                  rating: modifyRating(currentMovie.rating),
                  emptyColor: Colors.grey,
                  fillColor: Colors.red,
                ),
              ),
            ],
          ),
          Expanded(
            child: getDetails(context),
          )
        ],
      )
    );
  }

  Widget getDetails(context){
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          getMovieParameters(),
          getCasting(currentMovie.casting, context),
        ],
      ),
    );
  }

  Widget getMovieParameters(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'LENGTH',
              style: TextStyle(
                fontSize: smallFontSize,
                color: Color(0xffB6B5B8),
                letterSpacing: 1,
              ),
            ),
            RichText(
              text: new TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: new TextStyle(
                  fontSize: bigFontSize,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
                children: <TextSpan>[
                  new TextSpan(text: '${currentMovie.movieLength.truncate()}'),
                  new TextSpan(text: 'h ', style: new TextStyle(fontSize: smallFontSize)),
                  new TextSpan(text: '${int.tryParse(currentMovie.movieLength.toString().split('.')[1])}'),
                  new TextSpan(text: 'min', style: new TextStyle(fontSize: smallFontSize)),
                ],
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'LANGUAGE',
              style: TextStyle(
                fontSize: smallFontSize,
                color: Colors.grey,
              ),
            ),
            Text(
              '${currentMovie.language}',
              style: TextStyle(
                fontSize: bigFontSize,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'RATING',
              style: TextStyle(
                fontSize: smallFontSize,
                color: Colors.grey,
                letterSpacing: 1,
              ),
            ),
            RichText(
              text: new TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: new TextStyle(
                  fontSize: bigFontSize,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
                children: <TextSpan>[
                  new TextSpan(text: '${currentMovie.rating.truncate()},'),
                  new TextSpan(text: '${int.tryParse(currentMovie.rating.toString().split('.')[1])}', style: new TextStyle(fontSize: smallFontSize)),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Widget getCasting(List<ActorModel> casting, BuildContext context){
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 30, top: 25),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'CASTING',
              style: TextStyle(
                color: Colors.grey,
                fontSize: smallFontSize,
                fontWeight: FontWeight.bold
              ),
            )
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: casting.length,
            itemBuilder: (context, index){
              return CastingActorCard(actor: casting[index]);
            }
          ),
        ),
      ],
    );
  }

  double modifyRating(double rating){
    return (5 * rating.round()) / 10;
  }
}

