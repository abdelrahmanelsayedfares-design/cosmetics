part of '../view.dart';

class AppListViewCart extends StatefulWidget {
  const AppListViewCart({super.key});

  @override
  State<AppListViewCart> createState() => _AppListViewCartState();
}

class _AppListViewCartState extends State<AppListViewCart> {
  List<ProductsModel> fetchedList = [];
  List<int> quantities = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    setState(() => isLoading = true);

    final resp = await DioHelper.getData('api/Cart');

    if (resp.isSuccess) {
      final items = resp.data['items'] ?? [];

      fetchedList = ProductsData.fromJsonList(items).list;

      quantities = items.map<int>((e) {
        return (e['quantity'] as num).toInt();
      }).toList();
    } else {
      showMasg(resp.msg, isError: true);
    }

    setState(() => isLoading = false);
  }

  Future<void> removeItem(int index) async {
    final id = fetchedList[index].id;

    final resp = await DioHelper.deleteData('api/Cart/remove/$id');

    if (resp.isSuccess) {
      setState(() {
        fetchedList.removeAt(index);
        quantities.removeAt(index);
      });

      showMasg('Removed successfully');
    } else {
      showMasg(resp.msg, isError: true);
    }
  }

  Future<void> updateQty(int index, int qty) async {
    final productId = fetchedList[index].id;

    final resp = await DioHelper.sendData(
      'api/Cart/update?productId=$productId&quantity=$qty',
    );

    if (resp.isSuccess) {
      setState(() {
        quantities[index] = qty;
      });
    } else {
      showMasg(resp.msg, isError: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (fetchedList.isEmpty) {
      return const Center(child: Text('Cart is empty'));
    }

    return ListView.separated(
      padding:  EdgeInsets.symmetric(horizontal: 6).copyWith(bottom: 100).r,
      physics:  NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: fetchedList.length,
      separatorBuilder: (_, __) =>  Divider(height: 30.h),
      itemBuilder: (context, index) {
        final item = fetchedList[index];

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AppImage(image: item.image, width: 102.w, height: 102.h),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: IconButton(
                    onPressed: () => removeItem(index),
                    icon: AppImage(image: 'delete.svg'),
                  ),
                ),
              ],
            ),

             SizedBox(width: 10.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    item.name_en,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff3B4569),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    item.description_en,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff3B4569BA).withValues(alpha: .73),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    '${item.price}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff3B4569),
                    ),
                  ),

                   SizedBox(height: 10.h),

                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff8E8EA9)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 142,
                      height: 42,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (quantities[index] > 1) {
                                setState(() {
                                  quantities[index]--;
                                });
                              }
                            },
                            icon: AppImage(image: 'minus.svg', width: 20),
                          ),
                          Text(
                            '${quantities[index]}',
                            style: TextStyle(
                              color: Color(0xff434C6D),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                quantities[index]++;
                              });
                            },
                            icon: AppImage(
                              image: 'plus.svg',
                              width: 16,
                              height: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class ProductsModel {
  late final String name_en, name_ar, description_en, description_ar, image;
  late final int id, categoryId, stock;
  late final num price;
  late final int quantity;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['product_id'] ?? 0;
    name_en = json['product_name_en'] ?? "";
    name_ar = json['product_name_ar'] ?? "";
    description_en = json['description_en'] ?? "";
    description_ar = json['description_ar'] ?? "";
    price = json['price'] ?? 0;
    stock = json['stock'] ?? 0;
    image = json['image_url'] ?? "";
    categoryId = json['category_id'] ?? 0;

    quantity = json['quantity'] ?? 1;
  }
}

class ProductsData {
  final List<ProductsModel> list;

  ProductsData.fromJsonList(List<dynamic> jsonList)
    : list = jsonList.map((e) => ProductsModel.fromJson(e)).toList();
}
