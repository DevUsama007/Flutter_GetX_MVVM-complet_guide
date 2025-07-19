import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class opacityclas extends GetxController{
  RxDouble visibility=0.8.obs;
  changeopacity(double value){
visibility.value=value;
  }
}