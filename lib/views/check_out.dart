import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_back.dart';
import 'package:cosmetics/core/ui/app_buttom.dart';
import 'package:cosmetics/core/ui/app_images.dart';
import 'package:cosmetics/views/pin_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../core/ui/app_details_text.dart';

class CheckOutView extends StatelessWidget {
   CheckOutView({super.key});

  List<Marker> Markes = [
    Marker(markerId: MarkerId('1'), position: LatLng(31.048724, 31.389697)),
  ];

  // late GoogleMapController mapController;
  CameraPosition cameraPosition = (CameraPosition(
    target: LatLng(31.048724, 31.389697),
    zoom: 14,
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('CheckOut'),
        leading: AppBack(paddingStart: 16),
      ),
      body: Container(
        height: 698,
        width: 390,
        decoration: BoxDecoration(
          color: const Color(0xff39D3DA).withValues(alpha: .11),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 27, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Delivery to',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 18.h),
                _Model(
                  title: 'Home',
                  supTitle: 'Mansoura, 14 Porsaid St',
                  leading: GestureDetector(
                    onTap: (){
                      goTo(PinLocationView(),canPop: true);

                    },
                    // onTap: ()async{
                    //   final lat = cameraPosition.target.latitude;
                    //   final lng = cameraPosition.target.longitude;
                    //
                    //   final availableMaps = await MapLauncher.installedMaps;
                    //
                    //   await availableMaps.first.showMarker(
                    //     coords: Coords(31.048724, 31.389697),
                    //     title: "الموقع",
                    //   );
                    // },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        height: 60.h,
                        width: 97.w,
                        child: AbsorbPointer(
                          absorbing: true,
                          child: GoogleMap(
                            scrollGesturesEnabled: false,
                            zoomGesturesEnabled: false,
                            myLocationButtonEnabled: false,
                            zoomControlsEnabled: false,
                            mapType: MapType.terrain,
                            markers: Markes.toSet(),
                            initialCameraPosition: cameraPosition,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Text(
                  'Payment Method',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 18.h),
                _Model(title: '**** **** **** 0256', leadingImage: 'meza.svg'),
                SizedBox(height: 12),
                _Model(
                  title: 'Add vaucher',
                  leadingImage: 'voucher.svg',
                  trailing: AppButtom(
                    text: 'Apply',
                    onPressed: () {},
                    size: Size(77.w, 33.650634765625.h),
                  ),
                ),

                SizedBox(height: 31.5),
                Text(
                  '  -' * 100,
                  maxLines: 1,
                  style: TextStyle(
                    color: Color(0xff434C6D4F).withValues(alpha: .31),
                  ),
                ),
                SizedBox(height: 31.5.h),
                Text(
                  '- REVIEW PAYMENT',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff434C6D),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'PAYMENT SUMMARY',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff434C6D),
                  ),
                ),
                SizedBox(height: 40.h),
                DetailsText(text: 'Subtotal', title: '16.100 EGP'),
                SizedBox(height: 10.h),
                DetailsText(
                  text: 'SHIPPING FEES',
                  title: 'TO BE CALCULATED',
                ),
                SizedBox(height: 30.h),
                Divider(
                  color: Colors.lightBlueAccent,
                  height: .5.h,
                  thickness: 1,
                ),
                SizedBox(height: 30),
                DetailsText(text: 'TOTAL + VAT', title: '16.100 EGP',valueFontWeight: FontWeight.bold,),
                SizedBox(height: 35),
                AppButtom(text: 'ORDER', onPressed: (){},icon: 'order.svg',),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Model extends StatelessWidget {
  final String title;
  final String? supTitle;
  final String? leadingImage;
  final Widget? leading;
  final Widget? trailing;
  _Model({
    super.key,
    required this.title,
    this.supTitle,
    this.leadingImage,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 14.0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xff73B9BB), width: 1.5),
        borderRadius: BorderRadius.circular(30),
      ),
      leading:
          leading ?? AppImage(height: 24, width: 30, image: leadingImage ?? ''),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xff434C6D),
            ),
          ),
          if (supTitle != null)
            Text(supTitle!, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
      trailing: trailing ?? AppImage(image: 'arrow.svg'),
    );
  }
}
