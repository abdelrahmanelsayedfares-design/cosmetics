import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_counter_code.dart';
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
  final ValueChanged<String>? onCountryCodeChanged;
  final  String? Function(String?)? validator;
  final TextEditingController? controller;
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
    this.controller,
      this.onCountryCodeChanged, this.validator,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool _obscureText = true;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.withCountrycode)
            AppCounterCode(onCountryCodeChanged: widget.onCountryCodeChanged),
          Expanded(
            child: TextFormField(
              validator:widget.validator ,
              keyboardType: widget.TextInputTypee,
              obscureText: widget.isPassword ? _obscureText : false,
              controller: widget.controller,
              decoration: InputDecoration(
                enabledBorder: (inputTheme.enabledBorder as OutlineInputBorder?)
                    ?.copyWith(borderRadius: borderRadius),
                focusedBorder: (inputTheme.focusedBorder as OutlineInputBorder?)
                    ?.copyWith(borderRadius: borderRadius),
                labelText: widget.labelText,
                suffixIcon: widget.isPassword
                    ?AppImage(
                          image:
                          'eyeoff.json',
                          width: 22,
                          height: 19.15,
                          fit: BoxFit.scaleDown,
                          onLottieClicked: () {
                            _obscureText=!_obscureText;
                            setState(() {

                            });
                          },
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
