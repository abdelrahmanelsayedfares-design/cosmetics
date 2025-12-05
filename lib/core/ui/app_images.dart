import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class AppImage extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final Color? color;
  final bool isCircle;
  final BoxFit? fit;

  const AppImage({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.isCircle = false,
    this.color,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (image.isEmpty) return SizedBox.shrink();
    if (image.toLowerCase().endsWith('.svg')) {
      child = SvgPicture.asset(
        'assets/icons/$image',
        width: width,
        height: height,
        color: color,
        fit: fit ?? BoxFit.scaleDown,
      );
    } else if (image.startsWith('http')) {
      child = Image.network(
        image,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        color: color,

        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(),
            ),
          );
        },
      );
    } else if (image.toLowerCase().endsWith('.json')) {
      child = Lottie.asset(
        'assets/looties/$image',
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
      );
    } else {
      child = Image.asset(
        'assets/images/$image',
        width: width,
        height: height,
        color: color,
        fit: fit ?? BoxFit.scaleDown,
      );
    }

    if (isCircle) {
      return ClipOval(child: child);
    }

    return child;
  }
}
