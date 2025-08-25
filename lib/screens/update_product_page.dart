import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_app/models/product_model.dart';
import 'package:my_app/services/update_product_service.dart';
import 'package:my_app/widgets/custom_button.dart';
import 'package:my_app/widgets/custom_text_form_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = 'UpdateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, img, price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Update Product', style: TextStyle(color: Colors.black)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 170),
                  CustomTextFormField(
                    onChange: (data) {
                      productName = data;
                    },
                    labelText: 'product name',
                    hintText: 'product name',
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    onChange: (data) {
                      desc = data;
                    },
                    labelText: 'description',
                    hintText: 'description',
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    onChange: (data) {
                      price = data;
                    },
                    textInputType: TextInputType.number,
                    labelText: 'price',
                    hintText: 'price',
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    onChange: (data) {
                      img = data;
                    },
                    labelText: 'image',
                    hintText: 'image',
                  ),
                  SizedBox(height: 70),
                  CustomButton(
                    onTap: () {
                      isLoading = true;
                      setState(() {});
                      try {
                        UpdateProduct(productModel);
                        Navigator.pop(context, true);
                      } on Exception catch (e) {
                        print(e.toString());
                      }
                    },
                    color: Colors.black,
                    text: 'Update',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void UpdateProduct(ProductModel productModel) async {
    await UpdateProductService().UpdateProduct(
      id: productModel.id,
      title: productName == null ? productModel.title: productName!,
      price: price == null ? productModel.price.toString(): price!,
      description: desc == null ? productModel.description : desc!,
      image: img == null ?productModel.image: img!,
      category: productModel.category,
    );
  }
}
