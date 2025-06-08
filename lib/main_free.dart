import 'package:flutter/material.dart';
import 'models/flavor_config.dart';
import 'app.dart';

void main() {
  FlavorConfig.appFlavor = Flavor.free; // Define o sabor do app
  runApp(PoupexApp(flavorConfig: FlavorConfig(),));
}