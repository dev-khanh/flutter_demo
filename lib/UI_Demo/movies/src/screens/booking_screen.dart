import 'package:flutterappexample/UI_Demo/movies/src/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class BookingScreen extends StatefulWidget {
  final MovieModel currentMovie;
  BookingScreen({this.currentMovie});
  @override
  _BookingScreenState createState() => _BookingScreenState();
}
class _BookingScreenState extends State<BookingScreen> with TickerProviderStateMixin{
  final double smallFontSize = 10.0;
  final double bigFontSize = 25.0;
  final double start = 0.7;
  final double end = 0.6;
  final double startPosition = 540;
  final double endPosition = 450;
  AnimationController animationController;
  Animation<double> positionAnimation;
  Animation<double> colorAnimation;
  Animation buttonAnimation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600)
    );
    positionAnimation = Tween(begin: startPosition, end: endPosition)
      .animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut),
    );
    colorAnimation = Tween(begin: start, end: end)
      .animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut),
    );
    buttonAnimation = Tween(begin: -pi/2, end:  pi/2)
      .animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        overflow: Overflow.clip,
        children: <Widget>[
          getPoster(context),
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child){
              return Positioned(
                top: positionAnimation.value,
                child: child,
              );
            },
            child: getDetails(context),
          ),
        ],
      ),
    );
  }

  Widget getDetails(context){
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 15),
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          getNameWithRating(),
          SizedBox(
            height: 30,
          ),
          getMovieParameters(),
          SizedBox(
            height: 30,
          ),
          getBookingButton(),
        ],
      ),
    );
  }

  Widget getPoster(context){
    return Container(
      height:MediaQuery.of(context).size.height * 0.75,
      width: double.infinity,
      child: Hero(
        tag: widget.currentMovie.title,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child){
            return ShaderMask(
              child: child,
              shaderCallback: (Rect bounds){
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0x20FFFFFF),
                    Colors.white
                  ],
                  stops: [0.0, colorAnimation.value.toDouble()]
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
            );
          },
          child: Image.asset(
            '${widget.currentMovie.imagePath}',
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          )
        ),
      ),
    );
  }

  Widget getNameWithRating(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: SizedOverflowBox(
            size: Size(MediaQuery.of(context).size.width * 0.7, MediaQuery.of(context).size.height * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${widget.currentMovie.title.toUpperCase()}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight:FontWeight.bold,
                    letterSpacing: 1.2
                  ),
                ),
                FlutterRatingBarIndicator(
                  itemSize: 15,
                  rating: modifyRating(widget.currentMovie.rating),
                  emptyColor: Colors.grey,
                  fillColor: Colors.red,
                ),
              ],
            ),
          ),
        ),
//        SizedBox(width: 1,),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: RaisedButton(
            color: Colors.white,
            elevation: 10.0,
            onPressed: (){
              if(animationController.status == AnimationStatus.completed){
                animationController.reverse();
              }else{
                animationController.forward();
              }

            },
            shape: CircleBorder(
              side: BorderSide(
                style: BorderStyle.none,
                color: Colors.redAccent,
                width: 15),
            ),
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child){
                return Transform.rotate(
                  angle: buttonAnimation.value,
                  child: child,
                );
              },
              child: Icon(
                Icons.forward,
                size: 17,
                color: Colors.redAccent,
              ),
            )
          ),
        )]);
  }

  Widget getMovieParameters(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
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
                  new TextSpan(text: '${widget.currentMovie.movieLength.truncate()}'),
                  new TextSpan(text: 'h ', style: new TextStyle(fontSize: smallFontSize)),
                  new TextSpan(text: '${int.tryParse(widget.currentMovie.movieLength.toString().split('.')[1])}'),
                  new TextSpan(text: 'min', style: new TextStyle(fontSize: smallFontSize)),
                ],
              ),
            )
          ],
        ),
        SizedBox(width: 70,),
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
              '${widget.currentMovie.language}',
              style: TextStyle(
                fontSize: bigFontSize,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
        SizedBox(width: 70,),
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
                  new TextSpan(text: '${widget.currentMovie.rating.truncate()},'),
                  new TextSpan(text: '${int.tryParse(widget.currentMovie.rating.toString().split('.')[1])}', style: new TextStyle(fontSize: smallFontSize)),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget getBookingButton(){
    return RaisedButton(
      onPressed: (){
      },
      color: Colors.redAccent,
      child: Text('BOOK A TICKET'),
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25)
      ),
      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
    );
  }

  double modifyRating(double rating){
    return (5 * rating.round()) / 10;
  }
}

