import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_images.dart';

class AppInput extends StatefulWidget {
  final String? image;
  final String labelText;
  final bool isPassword;
  final VoidCallback? onIconPressed;
  final TextInputType TextInputTypee;
  final bool withCountrycode;
  final double? bootomSpace;
  final String? suffixImage;
  final double? borderRadius;
  AppInput({
    super.key,
    this.image,
    this.onIconPressed,
    required this.labelText,
    required this.TextInputTypee,
    this.isPassword = false,
    this.withCountrycode = false,
    this.bootomSpace,
    this.suffixImage,
    this.borderRadius,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  late int selectedValue;
  bool _obscureText = true;
  final List = [20, 30, 40, 50];
  initState() {
    super.initState();
    selectedValue = List.first;
  }

  @override
  Widget build(BuildContext context) {
    final inputTheme = Theme.of(context).inputDecorationTheme;
    final borderRadius = BorderRadius.circular(widget.borderRadius ?? 8.r);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 13,
        vertical: widget.bootomSpace ?? 16,
      ).r,
      child: Row(
        children: [
          if (widget.withCountrycode)
            Padding(
              padding: EdgeInsetsDirectional.only(end: 6.w),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).inputDecorationTheme.enabledBorder!.borderSide.color,
                  ),
                ),
                child: DropdownButton(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4).r,
                  value: selectedValue,
                  icon: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 6),
                    child: AppImage(
                      image: 'down.svg',
                      width: 8.212553024291992.w,
                      height: 3.0836985111236572.h,
                    ),
                  ),
                  items: List.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(
                        '+${e.toString()}',
                        style: TextStyle(color: Color(0xff434C6D)),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectedValue = value!;
                    setState(() {});
                  },
                ),
              ),
            ),
          Expanded(
            child: TextFormField(
              keyboardType: widget.TextInputTypee,
              obscureText: widget.isPassword ? _obscureText : false,
              decoration: InputDecoration(
                enabledBorder: (inputTheme.enabledBorder as OutlineInputBorder?)
                    ?.copyWith(borderRadius: borderRadius),
                focusedBorder: (inputTheme.focusedBorder as OutlineInputBorder?)
                    ?.copyWith(borderRadius: borderRadius),
                labelText: widget.labelText,
                suffixIcon: widget.isPassword
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: AppImage(
                          image: _obscureText
                              ? 'eye_close.svg'
                              : 'eye_open.svg',
                          width: 22,
                          height: 19.15,
                        ),
                      )
                    : (widget.suffixImage != null)
                    ? AppImage(
                        image: widget.suffixImage!,
                        width: 16.758766174316406.w,
                        height: 17.605241775512695.h,
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
