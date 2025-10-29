import 'package:cosmetics/core/ui/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../core/ui/app_check_out.dart';
import '../core/ui/app_text_check_out.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: AppImage(image: 'buttom.svg', width: 31, height: 31),
        ),
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
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 27, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery to',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 18.h),
                AppCheckOut(
                  map: GoogleMap(
                    scrollGesturesEnabled: false,
                    zoomGesturesEnabled: false,
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                    mapType: MapType.normal,
                    markers: Markes.toSet(),
                    initialCameraPosition: cameraPosition,
                  ),
                  mapWidth: 97.w,
                  mapHeight: 60.h,
                  title: 'Home\n',
                  text: 'Mansoura, 14 Porsaid St',
                  height: 84,
                  borderRadius: BorderRadius.circular(30),
                  iconImage: AppImage(image: 'arrow.svg'),
                ),
                SizedBox(height: 40.h),
                Text(
                  'Payment Method',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 18.h),
                AppCheckOut(
                  image: AppImage(
                    image:
                        'https://ahlinformatica.com/wp-content/uploads/2021/06/mc-1-1536x937.png',
                  ),
                  imageHeight: 20.h,
                  imageWidth: 30.w,
                  title: ' **** **** **** 0256',
                  height: 57,
                  borderRadius: BorderRadius.circular(25),
                  iconImage: AppImage(image: 'arrow.svg'),
                ),
                SizedBox(height: 12),
                AppCheckOut(
                  image: AppImage(image: 'shape.svg', width: 40.w),
                  imageHeight: 20.h,
                  imageWidth: 30.w,
                  title: 'Add vaucher',
                  height: 57,
                  borderRadius: BorderRadius.circular(25),
                  button: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(77.w, 33.650634765625.h),
                    ),
                    onPressed: () {},
                    child: Text('Apply', style: TextStyle(color: Colors.white)),
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
                AppTextCheckOut(text: 'Subtotal', title: '16.100 EGP'),
                SizedBox(height: 10.h),
                AppTextCheckOut(
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
                AppTextCheckOut(text: 'TOTAL + VAT', title: '16.100 EGP'),
                SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppImage(image: 'order.svg'),
                      Text(' ORDER', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
