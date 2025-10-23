import 'package:cosmetics/core/ui/app_images.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
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
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Delivery to'),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 84,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.lightBlueAccent),
                ),
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      top: 12,
                      bottom: 12,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 97,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: GoogleMap(

                            // onMapCreated: (controller) {
                            //   mapController = controller;
                            // },
                            myLocationButtonEnabled: false,
                            zoomControlsEnabled: false,
                            mapType: MapType.normal,
                            markers: Markes.toSet(),
                            initialCameraPosition: cameraPosition,
                          ),
                        ),

                        Text('  Home\n  Mansoura, 14 Porsaid St'),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.expand_more,
                            color: Color(0xffDA498C),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Payment Method',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 57,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.lightBlueAccent),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      AppImage(
                        image:
                            'https://ahlinformatica.com/wp-content/uploads/2021/06/mc-1-1536x937.png',
                        width: 30,
                        height: 40,
                      ),
                      Text(
                        '  **** **** **** 0256',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff434C6D),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.expand_more, color: Color(0xffDA498C)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.lightBlueAccent),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      AppImage(image: 'shape.svg', width: 40),

                      Text(
                        "  Add vaucher",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Color(0xff434C6D),
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffDA498C),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Apply',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text('  -' * 100, maxLines: 1),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  '- REVIEW PAYMENT',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xff434C6D),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 10),
                child: Text(
                  'PAYMENT SUMMARY',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff434C6D),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff434C6D),
                        ),
                      ),
                      Text(
                        '16.100 EGP',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff434C6D),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SHIPPING FEES',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff434C6D),
                        ),
                      ),
                      Text(
                        'TO BE CALCULATED',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff434C6D),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Divider(
                  color: Colors.lightBlueAccent,
                  height: .5,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 20, top: 20),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TOTAL + VAT',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff434C6D),
                        ),
                      ),
                      Text(
                        '16.100 EGP',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff434C6D),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Container(
                  height: 58,
                  width: 233,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffDA498C),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart, color: Colors.white),
                        Text(' ORDER', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
