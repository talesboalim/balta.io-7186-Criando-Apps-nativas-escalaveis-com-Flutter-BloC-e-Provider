import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoppingcartapp/models/product-details.model.dart';
import 'package:shoppingcartapp/repositories/product.repository.dart';
import 'package:shoppingcartapp/ui/shared/widgets/shared/add-to-cart.widget.dart';
import 'package:shoppingcartapp/ui/shared/widgets/shared/progress.indicator.widget.dart';

class ProductPage extends StatelessWidget {
  final String id;
  final _repository = new ProductRepository();

  ProductPage({@required this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductDetailsModel>(
      future: _repository.get(id),
      builder: (context, snapshot) {
        ProductDetailsModel product = snapshot.data;

        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text(
              'Aguardando...',
            );
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: GenericProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasError)
              return Center(
                child: Text(
                  "Erro!${snapshot.data}",
                ),
              );
            return content(product);
        }

        return null;
      },
    );
  }

  Widget content(ProductDetailsModel product) {
    return Scaffold(
      appBar: AppBar(),
      body: new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product.images.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Container(
            width: 200,
            child: Image.network(
              product.images[index],
            ),
          );
        },
      ),
    );
  }
}
