
import 'package:erp_school/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomImage extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit fit;
  final String placeholder;
  const CustomImage(
      {super.key,
        required this.image,
        this.height,
        this.width,
        this.fit = BoxFit.cover,
        this.placeholder = Images.teacherPng});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      height: height,
      width: width,
      fit: fit,
      placeholder: (context, url) =>
          Image.asset(Images.teacherPng, height: height, width: width, fit: fit),
      errorWidget: (context, url, error) =>
          Image.asset(placeholder, height: height, width: width, fit: fit),
    );
  }
}
