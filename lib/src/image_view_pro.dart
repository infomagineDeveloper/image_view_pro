
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageViewPro extends StatelessWidget {
  String? url;
  String? imagePath;
  String? svgPath;
  String? svgString;
  File? file;
  double? height;
  double? width;
  Color? color;
  final BoxFit fit;
  final String placeHolder;

  ///a [CommonNetworkImageView] it can be used for showing any network images
  /// it will shows the placeholder image if image is not found on network
  ImageViewPro({
    this.url,
    this.imagePath,
    this.svgPath,
    this.svgString,
    this.file,
    this.height,
    this.width,
    this.color,
    this.fit = BoxFit.fill,
    this.placeHolder = 'assets/images/image_not_found.png',
  });

  @override
  Widget build(BuildContext context) {
    return _buildImageView();
  }

  Widget _buildImageView() {
    if (svgPath != null && svgPath!.isNotEmpty) {
      return SizedBox(
        height: height,
        width: width,
        child: SvgPicture.asset(
          svgPath!,
          height: height,
          width: width,
          fit: fit,
          color: color,
        ),
      );
    } else if (svgString != null && svgString!.isNotEmpty) {
      return SizedBox(
        height: height,
        width: width,
        child: SvgPicture.string(
          svgString!,
          height: height,
          width: width,
          fit: fit,
        ),
      );
    } else if (file != null && file!.path.isNotEmpty) {
      return Image.file(
        file!,
        height: height,
        width: width,
        fit: fit,
        color: color,
      );
    } else if (url != null && url!.isNotEmpty) {
      return Image.network(
          url!,
        height: height,
        width: width,
        fit: fit,
      );
    } else if (imagePath != null && imagePath!.isNotEmpty) {
      return Image.asset(
        imagePath!,
        height: height,
        width: width,
        fit: fit,
      );
    }
    return const SizedBox();
  }
}