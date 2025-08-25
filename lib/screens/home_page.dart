import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/models/product_model.dart';
import 'package:my_app/screens/add_product_page.dart';
import 'package:my_app/screens/update_product_page.dart';
import 'package:my_app/services/get_products_service.dart';
import 'package:my_app/widgets/custom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<ProductModel>> productsFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productsFuture = GetProductsServices().getAllProducts();
  }

  void reloadProducts() {
    setState(() {
      productsFuture = GetProductsServices().getAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('New Trend', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.cartShopping),
            color: Colors.black,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddProductPage.id);
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add, color: Colors.white),
        
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 65),
        child: FutureBuilder<List<ProductModel>>(
          future: productsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No products found'));
            } else if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 100,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      bool? updated =
                          await Navigator.pushNamed(
                                context,
                                UpdateProductPage.id,
                                arguments: products[index],
                              )
                              as bool?;

                      if (updated == true) {
                        reloadProducts();
                        print('doneeeeeeeeeeeee');
                      }
                    },
                    child: CustomCard(productModel: products[index]),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
