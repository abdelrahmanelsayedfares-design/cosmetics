import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppCheckOut extends StatelessWidget {
  final String? text;
  final String? title;
  final Widget? image;
  final GoogleMap? map;
  final double height;
  final BorderRadius borderRadius;
  final VoidCallback? onPressed;
  final ElevatedButton? button;
  final Widget? iconImage;
  final double? mapWidth;
  final double? mapHeight;
  final double? imageWidth;
  final double? imageHeight;

  const AppCheckOut({
    super.key,
    this.text,
    this.title,
    this.image,
    this.map,
    required this.height,
    required this.borderRadius,
    this.onPressed,
    this.button,
    this.iconImage,
    this.mapWidth,
    this.mapHeight,
    this.imageWidth,
    this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      height: height.h,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border.all(color: Colors.lightBlueAccent),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          top: 12,
          bottom: 12,
          right: 12,
        ).r,
        child: Row(
          children: [
            if (map != null || image != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: map != null ? mapWidth : imageWidth,
                  height: map != null ? mapHeight : imageHeight,
                  child: map ?? image,
                ),
              ),

            if (map != null || image != null) SizedBox(width: 10.w),
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: title,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff434C6D),
                      ),
                    ),
                    TextSpan(
                      text: text,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),

            button ??
                (iconImage != null
                    ? IconButton(
                        onPressed: onPressed ?? () {},
                        icon: iconImage!,
                      )
                    : IconButton(
                        onPressed: onPressed ?? () {},
                        icon: const Icon(Icons.arrow_forward_ios, size: 18),
                      )),
          ],
        ),
      ),
    );
  }
}
