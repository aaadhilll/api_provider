import 'package:get/get.dart';

class Controller extends GetxController {
  final count = 0.obs;

  incriment() => count.value++;
  decriment() => count.value == 0 ? 0 : count.value--;
}
