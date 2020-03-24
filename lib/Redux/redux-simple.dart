import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutter_redux/flutter_redux.dart';

enum Actions { Increment }
int counterReducer(int state, dynamic action) {
  if (action == Actions.Increment) {
    return state + 1;
  }
  return state;
}
class redux_simple extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final store = new Store<int>(counterReducer, middleware: [thunkMiddleware], initialState: 0);
    return (FlutterReduxApp(title: 'Flutter Redux Demo', store: store));
  }
}
class FlutterReduxApp extends StatelessWidget {
  final Store<int> store;
  final String title;
  FlutterReduxApp({Key key, this.store, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new StoreProvider<int>(
      store: store,
      child: MaterialApp(
        theme: ThemeData.dark(),
        title: title,
        home: Scaffold(
          appBar: AppBar(
            title: new Text(title),
          ),
          body: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Simple(),
                AddButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<int, VoidCallback>(
      converter: (store) {
        return () => store.dispatch(Actions.Increment);
      },
      builder: (context, callback) {
        return new FloatingActionButton(
          onPressed: callback,
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        );
      },
    );
  }
}

class Simple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<int, String>(
      converter: (store) => store.state.toString(),
      builder: (context, count) {
        return new Text(
          count,
          style: Theme.of(context).textTheme.display1,
        );
      },
    );
  }
}