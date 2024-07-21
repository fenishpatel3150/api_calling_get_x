import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool validationComplete = true.obs;

  void validation() {
    validationComplete.value = !validationComplete.value;
  }
}
