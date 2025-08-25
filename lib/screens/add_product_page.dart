import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_app/services/add_product_service.dart';
import 'package:my_app/services/get_categories_service.dart';
import 'package:my_app/widgets/custom_button.dart';
import 'package:my_app/widgets/custom_text_form_field.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});
  static String id = 'AddProductPAge';

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  String? title, price, desc, image, category;
  bool isLoading = false;
  List<String> categories = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCategories();
  }

  void loadCategories() async {
    try {
      List<dynamic> data = await GetCategoriesService().getAllCategories();
      setState(() {
        categories = data.cast<String>();
      });
    } catch (e) {
      print("Error loading categories: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Add Product', style: TextStyle(color: Colors.black)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 170),
                  CustomTextFormField(
                    labelText: 'title',
                    hintText: 'title',
                    onChange: (data) {
                      title = data;
                    },
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    labelText: 'price',
                    hintText: 'price',
                    textInputType: TextInputType.number,
                    onChange: (data) {
                      price = data;
                    },
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    labelText: 'description',
                    hintText: 'description',
                    onChange: (data) {
                      desc = data;
                    },
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    labelText: 'image',
                    hintText: 'image',
                    onChange: (data) {
                      image = data;
                    },
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    items: categories.map((category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        category = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: "Category",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 70),
                  CustomButton(
                    onTap: () {
                      isLoading = true;
                      setState(() {});
                      try {
                        AddProduct();
                        Navigator.pop(context);
                      } on Exception catch (e) {
                        print(e.toString());
                      }
                      isLoading = false;
                      setState(() {});
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

  void AddProduct() async {
    await AddProductService().addProduct(
      title: title!,
      price: price!,
      description: desc!,
      image: image!,
      category: category!,
    );
  }
}
