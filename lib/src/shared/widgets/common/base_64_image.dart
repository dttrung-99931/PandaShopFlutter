import 'package:evievm_app/core/utils/assets/assets.dart';
import 'package:evievm_app/core/utils/encode_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Base64Image extends StatelessWidget {
  const Base64Image({
    super.key,
    required this.base64Image,
    required this.defaultImageAsset,
    this.height,
    this.width,
    this.isCircle = false,
    this.fit = BoxFit.fill,
  });

  final String? base64Image;
  final String defaultImageAsset;
  final double? height;
  final double? width;
  final bool isCircle;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: isCircle ? BorderRadius.circular(200) : BorderRadius.zero,
      child: base64Image != null
          ? base64Image!.contains('data:image/svg')
              ? SvgPicture.string(
                  decodeBase64String(base64Image!),
                  width: width,
                  height: height,
                  fit: fit,
                )
              : Image(
                  image: MemoryImage(decodeBase64(base64Image!)!),
                  width: width,
                  height: height,
                  fit: fit,
                )
          : defaultImageAsset.contains('svg')
              ? defaultImageAsset.buildSvg(
                  width: width,
                  height: height,
                  fit: fit,
                )
              : defaultImageAsset.build(
                  width: width,
                  height: height,
                  fit: fit,
                ),
    );
  }
}
