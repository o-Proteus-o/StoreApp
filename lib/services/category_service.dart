import 'package:fake_store/helper/api.dart';
import 'package:fake_store/models/all_product_model.dart';

class CategoryService {
  Future<List<AllProductModel>> getCategory({
    required String categoryName,
  }) async {
    List<dynamic> data = await Api().get("url");
    List<AllProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(AllProductModel.fromJson(data[i]));
    }
    return productsList;
  }
}
