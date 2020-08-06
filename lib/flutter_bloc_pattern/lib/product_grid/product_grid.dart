import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern_example/cart/cart_bloc.dart';
import 'package:flutter_bloc_pattern_example/cart/cart_provider.dart';
import 'package:flutter_bloc_pattern_example/catalog/catalog_bloc.dart';
import 'package:flutter_bloc_pattern_example/catalog/catalog_slice.dart';
import 'package:flutter_bloc_pattern_example/product_grid/product_square.dart';

class ProductGrid extends StatelessWidget {
  static const _loadingSpace = 40;
  static const _gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2);
  @override
  Widget build(BuildContext context) {
    final cartBloc = CartProvider.of(context);
    final catalogBloc = CatalogProvider.of(context);
    return StreamBuilder<CatalogSlice>(
      stream: catalogBloc.slice,
      initialData: CatalogSlice.empty(),
      builder: (context, snapshot) => GridView.builder(
        gridDelegate: _gridDelegate,
        itemCount: snapshot.data.endIndex + _loadingSpace,
        itemBuilder: (context, index) =>
            _createSquare(index, snapshot.data, catalogBloc, cartBloc),
      ),
    );
  }
  Widget _createSquare(int index, CatalogSlice slice, CatalogBloc catalogBloc, CartBloc cartBloc) {
    catalogBloc.index.add(index);
    final product = slice.elementAt(index);
    if (product == null) {
      return Center(child: CircularProgressIndicator());
    }
    return ProductSquare(
      key: Key(product.id.toString()),
      product: product,
      itemsStream: cartBloc.items,
      onTap: () {
        cartBloc.cartAddition.add(CartAddition(product));
      },
    );
  }
}
