import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

part './icons.dart';
part './images.dart';
part './rives.dart';

class Assets {
  static final img = _Image();
  static final ic = _Icon();
  static final riv = _Rives();
}

extension StringAssetExt on String {
  SvgPicture buildSvg({double? width, double? height, BoxFit fit = BoxFit.contain}) {
    return SvgPicture.asset(
      this,
      width: width,
      height: height,
      fit: fit,
    );
  }

  Widget build({double? width, double? height, BoxFit fit = BoxFit.contain}) {
    return Image.asset(
      this,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
