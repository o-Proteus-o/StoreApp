import 'package:fake_store/helper/api.dart';
import 'package:fake_store/models/all_product_model.dart';

class AddProduct {
  Future<AllProductModel> addProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: "https://fakestoreapi.com/products",
      body: {
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "category": category,
      },
      token: null,
    );
    return AllProductModel.fromJson(data);
  }
}
