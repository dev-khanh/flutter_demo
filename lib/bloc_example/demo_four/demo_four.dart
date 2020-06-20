import 'package:flutter/material.dart';
import 'package:flutterappexample/bloc_example/demo_four/example_bloc.dart';
import 'package:flutterappexample/bloc_example/demo_four/model_item.dart';
import 'package:flutterappexample/bloc_example/demo_four/provider_bloc.dart';
class DemoFour extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateDemoFour();
}
class _StateDemoFour extends State<DemoFour> {
  ExampleBloc _exampleBloc = ExampleBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProviderBloc(
          exampleBloc: _exampleBloc,
          child: ExampleScreen()
      ),
    );
  }
}
class ExampleScreen extends StatelessWidget {
  ExampleScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final exampleBloc = ProviderBloc.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter BLoC Pattern"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<List<ModelItem>>(
            stream: exampleBloc.item,
            initialData: List<ModelItem>(),
            builder: (context, snapshot) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () => exampleBloc.addStreamController.add(ModelItem("template.example", true)),
                  icon: Icon(Icons.add),
                  color: Colors.blue[500],
                ),
                Text('Items: ${snapshot.data.length.toString()}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
