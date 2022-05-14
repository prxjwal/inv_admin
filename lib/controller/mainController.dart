import 'package:get/get.dart';
import 'package:inv_admin/controller/firebaseController.dart';

final firebasecontroller = Get.put(firebaseController());

class MainController extends GetxController {
  RxInt tap = 0.obs;
  RxInt cat = 0.obs;
  var datafuturef;
  var datafutureb;
  var datafutures;
  var datafutureo;
  @override
  void onInit() {
    datafuturef = firebasecontroller.getdataFood();
    datafutureb = firebasecontroller.getdataBooks();
    datafutures = firebasecontroller.getdataStationary();
    datafutureo = firebasecontroller.getdataOthers();
    super.onInit();
  }
}
