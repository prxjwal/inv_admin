import 'package:get/get.dart';

class AddController extends GetxController {
  var day = DateTime.now().obs;
  var visib = 0.obs;
  DateTime? expday = DateTime.now();
  var cat = "Books";
  var productName = "";
  var price = "";
  var mrp = "";
  var quantity = "";
  var description = "";
  var expdate = "";
  var date = "";
}
