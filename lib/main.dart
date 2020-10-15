import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_to_do_list/screens/home_screen.dart';

void main() {
  GetStorage.init();
  runApp(GetMaterialApp(
    theme: ThemeData.dark(),
    home: HomeScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
