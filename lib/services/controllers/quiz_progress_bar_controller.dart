import 'package:get/get.dart';

class QuizProgressController extends GetxController {
  final count = 0.0.obs;

  increment() => count.value = count.value + 80;
}
