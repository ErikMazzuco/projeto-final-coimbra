import 'package:flutter/material.dart';

enum Flavor{
  free,
  premium
}

class FlavorConfig {

  static late Flavor appFlavor;

  static String get title{
    switch (appFlavor){
      case Flavor.free:
        return 'Poupex Free';
      case Flavor.premium:
        return 'Poupex Premium';
    }
  }

  
}