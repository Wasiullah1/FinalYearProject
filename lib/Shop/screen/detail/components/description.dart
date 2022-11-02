import 'package:flutter/material.dart';
import 'package:project_finalyear/Shop/models/products.dart';

import '../../../constant.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Column(children: [
        SizedBox(
          height: 50,
        ),
        Text(
          product.description,
          style: TextStyle(height: 1.0, fontSize: 20),
        ),
      ]),
    );
  }
}
