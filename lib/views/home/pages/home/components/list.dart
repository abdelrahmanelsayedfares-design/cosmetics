part of '../view.dart';

class _List extends StatefulWidget {
  final bool isTopRated;
  const _List({super.key, this.isTopRated = true});

  @override
  State<_List> createState() => _ListState();
}

class _ListState extends State<_List> {
  List<ProductModel>? list;

  Future<void> getData() async {
    final resp = await Dio().get(
      'https://cosmatics-302b5-default-rtdb.europe-west1.firebasedatabase.app/products/${widget.isTopRated ? 'top_rated.json' : 'most_ordered.json'}',
    );
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
          widget.isTopRated ? 'Top rated products' : 'Most ordered Products',
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
  late final String  title;
  late  String image;
  late final num price;
  late final int id;

  ProductModel.fromJson(Map<String, dynamic> json) {
    image = json["image"] ?? "";
    image = image.isEmpty
        ? 'https://th.bing.com/th/id/OIP.l6YuPV9OOXzk8kmuwPFurwAAAA?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3'
        : image;
    title = json["title"] ??json['tite']?? "";
    price = json["price"] ?? 0;
    id = json["id"] ?? 0;
  }
}

class ProductData {
  late List<ProductModel> list;
  ProductData.fromJsonList(List<dynamic> JsonList) {
    list = JsonList.map((e) => ProductModel.fromJson(e)).toList();
  }
}
