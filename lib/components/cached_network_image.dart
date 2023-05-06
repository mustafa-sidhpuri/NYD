import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  const CachedNetworkImageWidget({Key? key, required this.image,  this.height,  this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CachedNetworkImage(
      imageUrl: image,
      height: height,
      width: width,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Icon(Icons.person),
      fit: BoxFit.cover,
    );
  }
}
