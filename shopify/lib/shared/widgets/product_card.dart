import 'package:flutter/material.dart';
import 'package:shopify/models/product_model.dart';
import 'package:shopify/screens/Update/update_product_screen.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    required this.productModel,
  });

  ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateProductScreen.id,arguments: productModel);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            shadowColor: Colors.grey,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    productModel.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(

                        '\$${productModel.price}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 5,
            bottom: 100,
            child: Image.network(
              productModel.image,
              height: 80,
            ),
          ),
        ],
      ),
    );
  }
}
