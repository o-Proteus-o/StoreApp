import 'package:fake_store/helper/api.dart';

class GetAllCategory {
  Future<List<dynamic>> getAllCategory() async {
    List<dynamic> data = await Api().get(
      "https://fakestoreapi.com/products/categories",
    );
    return data;
  }
}
