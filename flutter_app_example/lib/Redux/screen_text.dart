
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'actions.dart';
import 'state.dart';
import 'to_do_item.dart';

class ScreenText extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _ViewModel>(
    converter: (Store<AppState> store) => _ViewModel.create(store),
    builder: (BuildContext context, _ViewModel viewModel) => Scaffold(
      body: ListView(children: viewModel.items.map((_ItemViewModel item) => _createWidget(item)).toList()),
    ),
  );
}
class _ViewModel {
  final List<_ItemViewModel> items;
  final Function() onAddItem;
  _ViewModel( this.items, this.onAddItem);
  factory _ViewModel.create(Store<AppState> store) {
    List<_ItemViewModel> items = store.state.toDos.map((ToDoItem item) => _ToDoItemViewModel(item.title) as _ItemViewModel).toList();
    return _ViewModel( items, () => store.dispatch(DisplayListWithNewItemAction()));
  }
}
Widget _createWidget(_ItemViewModel item) {
    return _createToDoItemWidget(item);
}
Widget _createToDoItemWidget(_ToDoItemViewModel item) => Row(
  children: [
    Text(item.title),
  ],
);
abstract class _ItemViewModel {}
@immutable
class _ToDoItemViewModel extends _ItemViewModel {
  final String title;
  _ToDoItemViewModel(this.title);
}
