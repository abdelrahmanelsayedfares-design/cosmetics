part of '../view.dart';

class _Item extends StatelessWidget {
  final CategoryModel model;
  const _Item({super.key, required this.model, });

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(10),
          child: AppImage(
            image:
            model.image,
            width: 64.w,
            height: 69.h,
          ),
        ),
        SizedBox(width: 12.w),
        Text(
          model.name,
          style: TextStyle(
            fontSize: 14.sp,
            color: Color(0xff434C6D),
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        AppImage(image: 'forward.svg'),
      ],
    );
  }
}




