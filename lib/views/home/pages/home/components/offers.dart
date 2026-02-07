part of '../view.dart';

class _Offers extends StatefulWidget {
  const _Offers({super.key});

  @override
  State<_Offers> createState() => _OffersState();
}

class _OffersState extends State<_Offers> {
  List<OfferModel>? list;

  Future<void> getData()async{
    final resp = await DioHelper.getData('api/Sliders');
     list = OfferData.fromJsonList(resp.data).list;
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

// {
// "id": 2,
// "coupon_code": "WINTER2026",
// "discount_percent": 30,
// "description_title1_en": "Winter Sale",
// "description_title1_ar": "عروض الشتاء",
// "description_title2_en": "Up to 30% off",
// "description_title2_ar": "خصم يصل الى 30%",
// "image_url": "https://i.pinimg.com/736x/cf/ac/00/cfac002f2ef46a83e3d7cc4cf7d66048.jpg"
// },

class OfferModel {
  late final String coupon, image, subTitle1, subTitle2;
  late final num discount;
  late final int  id;

  OfferModel.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? 0;
    coupon = json["coupon_code"] ?? "";
    discount = json["discount_percent"] ?? 0;
    subTitle1 = json["description_title1_en"] ?? "";
    subTitle2 = json["description_title2_en"] ?? "";
    image = json["image_url"] ?? "";

  }
}

class OfferData {
  late List<OfferModel> list;
  OfferData.fromJsonList(List<dynamic> jsonList) {
    list = jsonList.map((e) => OfferModel.fromJson(e)).toList();
  }
}
