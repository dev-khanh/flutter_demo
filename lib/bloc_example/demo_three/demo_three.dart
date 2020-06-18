import 'package:flutter/material.dart';
import 'package:flutterappexample/bloc_example/demo_three/bloc_state_chang.dart';
import 'package:flutterappexample/bloc_example/demo_three/event.dart';

class DemoThree extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateDemoThree();
}

class _StateDemoThree extends State<DemoThree> {
  @override
  void initState() {
    super.initState();
    myName = 'DEVK';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          myName,
          style: TextStyle(
            color: Colors.yellow,
            fontSize: 50.0,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            blocStateChang.feeEventData(TriggerSwitchId());
          });
        },
        child: Text("RED"),
      ),
    );
  }
}
