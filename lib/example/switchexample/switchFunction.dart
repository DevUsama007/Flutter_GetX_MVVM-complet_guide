import 'package:get/get.dart';

class SwitchExampl extends GetxController{
  RxBool switchVal=false.obs;
  changeSwitch(bool value){
switchVal.value=value;
  }
}