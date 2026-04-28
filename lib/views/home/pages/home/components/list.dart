part of '../view.dart';

class _List extends StatefulWidget {
  const _List({super.key,});

  @override
  State<_List> createState() => _ListState();
}

class _ListState extends State<_List> {
  List<ProductModel>? list;

  Future<void> getData() async {
    final resp = await DioHelper.getData('api/Products');
    list = ProductData.fromJsonList(resp.data).list;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top rated products',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Color(0xff434C6D),
          ),
        ),
        SizedBox(height: 14.h),
        list == null
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 176 / 237,
                ),
                itemCount: list!.length,
                itemBuilder: (context, index) => _Item(model: list![index]),
              ),
      ],
    );
  }
}



class ProductModel {
  late final String name_en,name_ar, description_en,description_ar, image;
  late final int id, categoryId, stock;
  late final num price;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name_en = json['name_en'] ?? "";
    name_ar = json['name_ar'] ?? "";
    description_en = json['description_en'] ?? "";
    description_ar = json['description_ar'] ?? "";
    price = json['price'] ?? 0;
    stock = json['stock'] ?? 0;
    image = json['image_url'] ?? "";
    categoryId = json['category_id'] ?? 0;
  }
}

class ProductData {
  late List<ProductModel> list;
  ProductData.fromJsonList(List<dynamic> jsonList) {
    list = jsonList.map((e) => ProductModel.fromJson(e)).toList();
  }
}
