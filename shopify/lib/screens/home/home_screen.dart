import 'package:flutter/material.dart';
import 'package:shopify/models/product_model.dart';
import 'package:shopify/services/get_all_products.dart';
import 'package:shopify/shared/widgets/product_card.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String id = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Shopify',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(
          top: 60.0,
          bottom: 8,
          start: 8,
          end: 8,
        ),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductsService().getAllProducts(),
          builder: (context, snapshot) {
            print('check 1');
            if(snapshot.hasData){

              print('check 2');

              List<ProductModel>products=snapshot.data!;
              return GridView.builder(
                clipBehavior: Clip.none,
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 80,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(productModel: products[index],);
                },
              );
            }
            else
             {
               print('check 3');

                print(snapshot.error);
                return Center(child: CircularProgressIndicator());
              }

          },
        ),
      ),
    );
  }
}


