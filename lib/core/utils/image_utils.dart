import 'dart:async';

import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

Future<Image?> pickImage() {
  throw 'TODO:';
}

Future<Color> extractImageBackground(ImageProvider image) async {
  final PaletteGenerator pallet = await PaletteGenerator.fromImageProvider(image);
  return pallet.dominantColor?.color ?? pallet.colors.first;
}
