import 'package:fake_store/models/all_product_model.dart';
import 'package:fake_store/services/update_product.dart';
import 'package:fake_store/views/widgets/put/custom_text_field.dart';
import 'package:fake_store/views/widgets/put/update_appbar.dart';
import 'package:fake_store/views/widgets/put/update_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key, this.isLoading});
  static const routeName = "/update";
  final bool? isLoading;
  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String? title, desc, image;
  double? price;

  @override
  Widget build(BuildContext context) {
    var products =
        ModalRoute.of(context)!.settings.arguments as AllProductModel? ??
        AllProductModel(
          id: 0,
          title: '',
          price: 0,
          description: '',
          category: '',
          image: '',
          rating: RatingModel(rate: 0.0, count: 0),
        );
    return ModalProgressHUD(
      inAsyncCall: widget.isLoading ?? false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(height: 80),
            UpdateAppBar(),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.symmetric(vertical: 60),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                color: Colors.grey,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 150),
                      CustomTextField(
                        hintText: "Title",
                        onSubmitted: (value) {
                          title = value;
                        },
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        keyboardinputType: TextInputType.number,
                        hintText: "Price",
                        onSubmitted: (value) {
                          price = double.parse(value);
                        },
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        hintText: "Description",
                        onSubmitted: (value) {
                          desc = value;
                        },
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        hintText: "image",
                        onSubmitted: (value) {
                          image = value;
                        },
                      ),
                      SizedBox(height: 40),
                      UpdateButton(
                        onTap: () {
                          UpdateProduct().updateProduct(
                            title: title == null ? products.title : title!,
                            price:
                                price.toString() == null
                                    ? products.price.toString()
                                    : price!.toString(),
                            description:
                                desc == null ? products.description : desc!,
                            image: image == null ? products.image : image!,
                            category: products.category,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
