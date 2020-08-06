import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'base.dart';
import 'event/base_event.dart';
import 'event/count_event.dart';
import 'helper/bloc_creator.dart';

class HomePage extends StatelessWidget {
  const HomePage();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeBloc>(
      create: (_) => HomeBloc(),
      child: Badge(),
    );
  }
}

class Badge extends StatefulWidget {
  @override
  _BadgeState createState() => _BadgeState();
}

class _BadgeState extends State<Badge> with BlocCreator {
  HomeBloc homeBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (homeBloc == null) {
      homeBloc = createBloc<HomeBloc>();
    }
  }

  @override
  Widget build(BuildContext context) {
    var homeBloc = findBloc<HomeBloc>();
    return Container(
      height: 100,
      color: Colors.amber,
      child: Center(
        child: Text(
          "Count = ${homeBloc.count}",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}

class HomeBloc extends BaseBloc with ChangeNotifier {
  int count = 0;
  @override
  void dispatchEvent(BaseEvent event) {
    if (event is CountEvent) {
      count = event.count;
      notifyListeners();
    }
  }
}
