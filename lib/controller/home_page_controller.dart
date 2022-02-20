import 'package:get/get.dart';

import '../helper/dio_helper.dart';
import '../model/product_model.dart';

class HomeController extends GetxController {
  var products = <Product>[].obs;
  bool isloading = false;

  void getProduct() async {
    try {
      isloading = true;
      var response =
          await DioHelper.getData(url: "http://fakestoreapi.com/products");
      // var product1 = Product.fromJson(response.data[1]);
      // print(product1.image);

      

      isloading = false;
    } on Exception catch (e) {
      isloading = false;
      throw Exception(e);
    }
  }

  @override
  void onInit() async {
    getProduct();
    super.onInit();
    print(" init HomeController ");
  }
}
