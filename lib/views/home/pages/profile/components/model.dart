part of '../view.dart';

class _Model extends StatelessWidget {
  final String image, title;
  final Widget? page;
  final bool isLogout;

  const _Model({
    super.key,
    required this.title,
    required this.image,
    this.page,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    // final image = '${title.trim().toLowerCase().replaceAll(' ', '_')}.svg';
    return ListTile(
      onTap: page == null
          ? null
          : () async {
        if (isLogout) {
          final resp = await DioHelper.sendData('api/Auth/logout');
          // print('Abdooooooo ${resp.data}');
          if (resp.isSuccess) {
            //clear
            CacheHelper.logout();
            goToDest();
          } else {
            showMasg(resp.msg??'Something Wrong', isError: true);
          }
        }
      },
      leading: AppImage(image: image),
      title: Text(
        title,
        style: TextStyle(color: isLogout ? Color(0xffCD0F0F) : null),
      ),
      trailing: isLogout ? null : AppImage(image: 'vector.svg'),
    );
  }

  void goToDest() {
    goTo(page!,canPop: false);
  }
}
