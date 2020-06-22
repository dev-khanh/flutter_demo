import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutterappexample/demo_mvvm/model/Pokemon.dart';
import 'package:flutterappexample/demo_mvvm/view_model/view_model_poke_list.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final ViewModelPokeList viewModelPokemonList = ViewModelPokeList();
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      refresh();
    }
  }

  @override
  void initState() {
    super.initState();
    refresh();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result != ConnectivityResult.none) {
        refresh();
      }
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    viewModelPokemonList.closeObservable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            StreamBuilder<List<Pokemon>>(
              stream: viewModelPokemonList.pokemonList,
              builder: (context, snapshot){
                return listData(snapshot);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
  listData(AsyncSnapshot<List<Pokemon>> snapshot){
    if (snapshot.connectionState == ConnectionState.waiting) {
      return buildCircularProgressIndicatorWidget();
    }
    if (snapshot.hasError) {
      showSnackBar(context, snapshot.error.toString());
      return buildListViewNoDataWidget();
    }
    if (snapshot.connectionState == ConnectionState.active) {
      var pokemonList = snapshot.data;
      if (null != pokemonList)
        return buildListViewWidget(pokemonList);
      else
        return buildListViewNoDataWidget();
    }
  }
  Widget buildCircularProgressIndicatorWidget() {
    return Expanded(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
  Widget buildListViewNoDataWidget() {
    return Expanded(
      child: Center(
        child: Text("No Data Available"),
      ),
    );
  }
  Widget buildListViewWidget(List<Pokemon> pokemonList) {
    return Flexible(
      child: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: pokemonList.length,
        itemExtent: 25.0,
        itemBuilder: (BuildContext context, int index) {
          return Text(pokemonList[index].name);
        }),
    );
  }
  void showSnackBar(BuildContext context, String errorMessage) async {
    await Future.delayed(Duration.zero);
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
  }
  void refresh() {
    viewModelPokemonList.getPokemonList();
    setState(() {});
  }
}
