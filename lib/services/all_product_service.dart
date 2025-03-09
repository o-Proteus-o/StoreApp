import 'package:fake_store/helper/api.dart';
import 'package:fake_store/models/all_product_model.dart';

class GetAllProduct {
  Future<List<AllProductModel>> getAllProduct() async {
    List<dynamic> products = await Api().get(
      "https://fakestoreapi.com/products",
    );

    List<AllProductModel> productList = [];

    for (int i = 0; i < products.length; i++) {
      productList.add(AllProductModel.fromJson(products[i]));
    }

    return productList;
  }
}
