import 'package:fake_store/helper/api.dart';
import 'package:fake_store/models/all_product_model.dart';

class UpdateProduct {
  Future<AllProductModel> updateProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().put(
      url: "https://fakestoreapi.com/products/:id",
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
