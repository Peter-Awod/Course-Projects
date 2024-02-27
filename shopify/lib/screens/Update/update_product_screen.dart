import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shopify/models/product_model.dart';
import 'package:shopify/services/update_product.dart';
import 'package:shopify/shared/components/custom_text_form_field.dart';

import '../../shared/components/custom_material_button.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({super.key});

  static String id = 'UpdateProductScreen';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? title, description, image, price;

  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextFormField(
                    hintText: 'Product Name',
                    onChanged: (value) {
                      title = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    hintText: 'Description',
                    onChanged: (value) {
                      description = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    hintText: 'Price',
                    inputType: TextInputType.number,
                    onChanged: (value) {
                      price = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    hintText: 'Image',
                    onChanged: (value) {
                      image = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomMaterialButton(
                    onPressed: () async {
                      isLoading=true;
                      setState(() {

                      });
                      await updateProduct(productModel);
                      try {

                            print('Success');
                          }
                          catch (e){
                        print('Error eeeeeeeeee${e.toString()}');
                          }
                          isLoading=false;
                      setState(() {

                      });
                    },
                    buttonName: 'Update',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel productModel) async {
    await UpdateProductService().updateProduct(
      id: productModel.id,
      title: title == null ? productModel.title : title!,
      price: price == null ? productModel.price.toString() : price!,
      description: description == null
          ? productModel.description
          : description!,
      image: image == null ? productModel.image : image!,
      category: productModel.category,
    );
  }
}
