
import 'package:flutter_easyloading/flutter_easyloading.dart';

class PopupLoader{
static void show([indicator = EasyLoadingIndicatorType.dualRing]){
  EasyLoading.instance
      ..indicatorType = indicator
      ..maskType = EasyLoadingMaskType.clear;
  EasyLoading.show();
}
static void hide(){
  EasyLoading.dismiss();
}
}