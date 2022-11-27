import 'package:flutter/material.dart';
import 'package:midtrans_test/app/global/constant/colors.dart';

class GradientsApp {
  GradientsApp._();

  static const primary =
      LinearGradient(colors: [ColorsApp.primary, ColorsApp.primary2]);

  static const blue = LinearGradient(colors: [ColorsApp.blue, ColorsApp.blue2]);
}
