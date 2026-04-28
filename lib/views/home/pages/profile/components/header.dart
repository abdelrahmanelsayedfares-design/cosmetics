part of '../view.dart';

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          width: double.infinity.w,
          height: 152.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.bottomCenter,
              end: AlignmentDirectional.topCenter,
              colors: [
                Color(0xffECA4C5),
                Color(0xff434C6DD4).withValues(alpha: .83),
              ],
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4.w,
                spreadRadius: 0.w,
                color: Color(0xff00000040).withValues(alpha: .25),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 104).r,
          child: Center(
            child: AppImage(
              isCircle: true,
              image:
              CacheHelper.image,
              width: 96.w,
              height: 96.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
