import 'dart:async';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_pattern_example/services/catalog.dart';
import 'package:flutter_bloc_pattern_example/services/catalog_page.dart';
import 'package:flutter_bloc_pattern_example/catalog/catalog_slice.dart';
import 'package:rxdart/rxdart.dart';

class CatalogBloc {
  final _indexController = PublishSubject<int>();

  final _pages = <int, CatalogPage>{};

  final _pagesBeingRequested = Set<int>();

  final _sliceSubject = BehaviorSubject<CatalogSlice>();

  final CatalogService _catalogService;

  CatalogBloc(this._catalogService) {
    _indexController.stream.bufferTime(Duration(milliseconds: 500)).where((batch) => batch.isNotEmpty).listen(_handleIndexes);
  }
  Sink<int> get index => _indexController.sink;
  Stream<CatalogSlice> get slice => _sliceSubject.stream;
  int _getPageStartFromIndex(int index) => (index ~/ CatalogService.productsPerPage) * CatalogService.productsPerPage;

  void _handleIndexes(List<int> indexes) {
    const maxInt = 0x7fffffff;
    final int minIndex = indexes.fold(maxInt, min);
    final int maxIndex = indexes.fold(-1, max);

    final minPageIndex = _getPageStartFromIndex(minIndex);
    final maxPageIndex = _getPageStartFromIndex(maxIndex);

    for (int i = minPageIndex;
        i <= maxPageIndex;
        i += CatalogService.productsPerPage) {
      if (_pages.containsKey(i)) continue;
      if (_pagesBeingRequested.contains(i)) continue;

      _pagesBeingRequested.add(i);
      _catalogService.requestPage(i).then((page) => _handleNewPage(page, i));
    }

    // Remove pages too far from current scroll position.
    _pages.removeWhere((pageIndex, _) =>
        pageIndex < minPageIndex - CatalogService.productsPerPage ||
        pageIndex > maxPageIndex + CatalogService.productsPerPage);
  }

  void _handleNewPage(CatalogPage page, int index) {
    _pages[index] = page;
    _pagesBeingRequested.remove(index);
    _sendNewSlice();
  }

  void _sendNewSlice() {
    final pages = _pages.values.toList(growable: false);
    final slice = CatalogSlice(pages, true);
    _sliceSubject.add(slice);
  }
}

class CatalogProvider extends InheritedWidget {
  final CatalogBloc catalogBloc;
  CatalogProvider({ Key key, @required CatalogBloc catalog, Widget child })  : assert(catalog != null), catalogBloc = catalog, super(key: key, child: child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
  static CatalogBloc of(BuildContext context) => (context.inheritFromWidgetOfExactType(CatalogProvider) as CatalogProvider).catalogBloc;
}
