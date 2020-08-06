import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern_example/utils/is_dark.dart';
import 'package:flutter_bloc_pattern_example/widgets/cart_button.dart';
import 'package:flutter_bloc_pattern_example/widgets/theme.dart';
import 'package:flutter_bloc_pattern_example/cart/bloc_cart_page.dart';
import 'package:flutter_bloc_pattern_example/cart/cart_bloc.dart';
import 'package:flutter_bloc_pattern_example/cart/cart_provider.dart';
import 'package:flutter_bloc_pattern_example/catalog/catalog_bloc.dart';
import 'package:flutter_bloc_pattern_example/product_grid/product_grid.dart';
import 'package:flutter_bloc_pattern_example/services/catalog.dart';

void main() {
  final catalogService = CatalogService();
  final catalog = CatalogBloc(catalogService);
  final cart = CartBloc();
  runApp(MyApp(catalog, cart));
}
class MyApp extends StatelessWidget {
  final CatalogBloc catalog;
  final CartBloc cart;
  MyApp(this.catalog, this.cart);
  @override
  Widget build(BuildContext context) {

    return CatalogProvider(
      catalog: catalog,
      child: CartProvider(
        cartBloc: cart,
        child: MaterialApp(
          title: 'Bloc Complex',
          theme: appTheme,
          home: MyHomePage(),
          routes: {BlocCartPage.routeName: (context) => BlocCartPage()},
        ),
      ),
    );
  }
}
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartBloc = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.isStringDark("hello")),
        actions: <Widget>[
          StreamBuilder<int>(
            stream: cartBloc.itemCount,
            initialData: 0,
            builder: (context, snapshot) => CartButton(
              itemCount: snapshot.data,
              onPressed: () {
                Navigator.of(context).pushNamed(BlocCartPage.routeName);
              },
            ),
          )
        ],
      ),
      body: ProductGrid(),
    );
  }
}