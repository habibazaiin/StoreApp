import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/models/product_model.dart';
import 'package:my_app/screens/update_product_page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({required this.productModel, super.key});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          child: Card(
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.title.substring(0, 6),
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$'
                        '${productModel.price.toString()}',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      Icon(FontAwesomeIcons.heart, color: Colors.red),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 25,
          top: -45,
          child: Image.network(productModel.image, height: 100, width: 100),
        ),
      ],
    );
  }
}
