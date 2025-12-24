part of '../view.dart';

class _Offers extends StatefulWidget {
  const _Offers({super.key});

  @override
  State<_Offers> createState() => _OffersState();
}

class _OffersState extends State<_Offers> {
  List<OfferModel>? list;
  Future<void> getData() async {
    final resp = await Dio().get(
      'https://cosmatics-302b5-default-rtdb.europe-west1.firebasedatabase.app/offers.json',
    );
     list= OfferData.fromjsonlist(resp.data).list;
     setState(() {

     });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if(list==null){
      return Center(child: CircularProgressIndicator());

    }
    return CarouselSlider(
      options: CarouselOptions(height: 320.h,
        aspectRatio: 364.w/151.h,
        viewportFraction:1,
        autoPlay: true,
      ),
      items: List.generate(list!.length,
        (index) => Padding(
          padding:  EdgeInsetsDirectional.only(end: 12.r),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(20),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AppImage(
                  image:list![index].image,
                  height: 320.h,
                  width: double.infinity,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20).r,
                  color: Color(0xffE9DCD3).withValues(alpha: .8),
                  width: 364.w,
                  height: 151.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${list![index].discount}% OFF DISCOUNT \n CUPON CODE : ${list![index].coupon}',
                              style: TextStyle(
                                color: Color(0xff68372E),
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          AppImage(image: 'offer.svg'),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppImage(image: 'offer.svg'),
                          Spacer(),
                          Text(
                            '${list![index].subTitle1}\n ${list![index].subTitle2}',
                            style: TextStyle(
                              color: Color(0xff434C6D),
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
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


class OfferModel {
  late final String coupon, image, subTitle1, subTitle2;
  late final num discount;
  late final int productId, id;

  OfferModel.fromJson(Map<String, dynamic> json) {
    coupon = json["cupon"] ?? "";
    image = json["image"] ?? "";
    subTitle1 = json["sub_title1"] ?? "";
    subTitle2 = json["sub_title2"] ?? "";
    discount = json["discound"] ?? 0;
    productId = json["product_id"] ?? 0;
    id = json["id"] ?? 0;
  }
}

class OfferData {
  late List<OfferModel> list;
  OfferData.fromjsonlist(List<dynamic> JsonList) {
    list = JsonList.map((e) => OfferModel.fromJson(e)).toList();
  }
}
