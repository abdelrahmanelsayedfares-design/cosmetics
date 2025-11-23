import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class AppImage extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;

  const AppImage({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.color,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    if (image.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(
        'assets/icons/$image',
        width: width,
        height: height,
        color: color,
        fit: fit ?? BoxFit.scaleDown,
      );
    }else if(image.toLowerCase().endsWith('.svg')){
      return SvgPicture.asset(
        'assets/svg/$image',
        width: width,
        height: height,
        color: color,
        fit: fit ?? BoxFit.scaleDown,
      );

    }else if (image.startsWith('http')) {
      return Image.network(
        image,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        color: color,

        // لودينج أثناء تحميل الصورة
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: Icon(Icons.broken_image, size: 40, color: Colors.grey),
          );
        },
      );
    }
    else if(image.toLowerCase().endsWith('json')){

      return Lottie.asset('assets/looties/$image',
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,

      );
    }

    else {
      return Image.asset(
        'assets/images/$image',
        width: width,
        height: height,
        color: color,
        fit: fit ?? BoxFit.scaleDown,
      );
    }
  }
}
