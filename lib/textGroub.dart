import 'package:flutter/material.dart';

class TextGroub extends StatefulWidget {
  TextGroub({Key key, this.title}) : super(key: key);
  final String title;
  String radioValue = 'First';
  @override
  State<TextGroub> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TextGroub> with SingleTickerProviderStateMixin {

  _MyHomePageState() {
    customBuilder = (BuildContext context, List<dynamic> animValues, Function updateState, String value) {
      return GestureDetector(
        onTap: () {
          setState(() {
            widget.radioValue = value;
          });
        },
        child: Container(
          width: double.infinity,
          height: animValues[0] * 40 + 60,
          color: animValues[1],
          child: Center(
              child: Text(
                  value
              )
          ),
        ),
      );
    };
    simpleBuilder = (BuildContext context, List<double> animValues, Function updateState, String value) {
      final alpha = (animValues[0] * 255).toInt();
      return GestureDetector(
          onTap:  () {
            setState(() {
              widget.radioValue = value;
            });
          },
          child: Container(
              padding: EdgeInsets.all(32.0),
              margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 12.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor.withAlpha(alpha),
                  border: Border.all(
                    color: Theme.of(context).primaryColor.withAlpha(255 - alpha),
                    width: 4.0,
                  )
              ),
              child: Text(
                value,
                style: Theme.of(context).textTheme.body1.copyWith(fontSize: 20.0),
              )
          )
      );
    };
    dynamicBuilder = (BuildContext context, List<dynamic> animValues, Function updateState, String value) {
      return GestureDetector(
          onTap: () {
            setState(() {
              widget.radioValue = value;
            });
          },
          child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 12.0),
              padding: EdgeInsets.all(32.0 + animValues[0] * 12.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: animValues[1],
                  border: Border.all(
                      color: animValues[2],
                      width: 2.0
                  )
              ),
              child: Text(
                value,
                style: Theme.of(context).textTheme.body1.copyWith(
                    fontSize: 20.0,
                    color: animValues[2]
                ),
              )
          )
      );
    };
  }
  RadioBuilder<String, dynamic> customBuilder;
  RadioBuilder<String, double> simpleBuilder;
  RadioBuilder<String, dynamic> dynamicBuilder;
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 100),
        value: this
    );
    _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.ease
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomRadio<String, double>(
                  value: 'First',
                  groupValue: widget.radioValue,
                  duration: Duration(milliseconds: 500),
                  animsBuilder: (AnimationController controller) => [
                    CurvedAnimation(
                        parent: controller,
                        curve: Curves.easeInOut
                    )
                  ],
                  builder: simpleBuilder
              ),
              CustomRadio<String, double>(
                  value: 'Second',
                  groupValue: widget.radioValue,
                  duration: Duration(milliseconds: 500),
                  animsBuilder: (AnimationController controller) => [
                    CurvedAnimation(
                        parent: controller,
                        curve: Curves.easeInOut
                    )
                  ],
                  builder: simpleBuilder
              ),
              CustomRadio<String, double>(
                  value: 'Third',
                  groupValue: widget.radioValue,
                  duration: Duration(milliseconds: 500),
                  animsBuilder: (AnimationController controller) => [
                    CurvedAnimation(
                        parent: controller,
                        curve: Curves.easeInOut
                    )
                  ],
                  builder: simpleBuilder
              ),
            ],
          ),
        ],
      ),
    );
  }

}
typedef AnimationsBuilder<T> = List<Animation<T>> Function(AnimationController);

typedef RadioBuilder<T, U> = Widget Function(BuildContext context, List<U> animValues, Function updateState, T value);

class CustomRadio<T, U> extends StatefulWidget {

  final RadioBuilder<T, U> builder;

  final Duration duration;

  final AnimationsBuilder<U> animsBuilder;

  final T value;

  final T groupValue;

  bool get checked => value == groupValue;

  CustomRadio({
    Key key,
    this.animsBuilder,
    this.duration = const Duration(milliseconds: 600),
    @required this.builder,
    @required this.value,
    @required this.groupValue,
  })  : assert(duration != null),
        super(key: key);

  @override
  State<CustomRadio> createState() => _CustomRadioState<T, U>();
}

class _CustomRadioState<T, U> extends State<CustomRadio<T, U>>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<Animation> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, value: this);
    _animations = widget.animsBuilder(_controller);
    _animations.forEach((anim) => anim.addListener(() => setState(() {})));
    if (widget.checked)
      _controller.value = 1.0;
    else
      _controller.value = 0.0;
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _updateState() {
    setState(() {
      if (widget.checked && _controller.status != AnimationStatus.completed) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if ((widget.checked &&
        (_controller.status == AnimationStatus.dismissed ||
            _controller.status == AnimationStatus.reverse)) ||
        (!widget.checked &&
            (_controller.status == AnimationStatus.completed ||
                _controller.status == AnimationStatus.forward))) {
      _updateState();
    }

    final anims = _animations.map<U>((anim) => anim.value).toList();
    return widget.builder(
      context,
      anims.length > 0 ? anims : [widget.checked].cast<dynamic>(),
      _updateState,
      widget.value,
    );
  }
}