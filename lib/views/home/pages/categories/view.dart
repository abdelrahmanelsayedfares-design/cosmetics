import 'package:cosmetics/core/ui/app_images.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/ui/app_input.dart';
part 'components/item.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<CategoryModel>? list;
  Future<void> getData() async {
    final resp = await Dio().get(
      'https://cosmatics-302b5-default-rtdb.europe-west1.firebasedatabase.app/categories.json',
    );
    list = CategoriesData.fromJsonList(resp.data).list;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Categories')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 24, left: 13, right: 13).r,
          child: Column(
            children: [
              AppInput(
                borderRadius: 24.w,
                suffixImage: 'search.svg',
                labelText: 'Search',
                TextInputTypee: TextInputType.text,
                image: 'search.svg',
              ),
              SizedBox(height: 32),
              list == null
                  ? Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      padding: EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 31,
                      ).copyWith(bottom: 100).r,
                      separatorBuilder: (context, index) =>  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20).r,
                        child: Divider(color: Color(0xffb3b3c180)),
                      ),
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: list!.length,
                      itemBuilder: (context, index) => _Item(model: list![index],),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryModel {
  late final String image, name;
  late final int id;

  CategoryModel.fromjson(Map<String, dynamic> Json) {
    image = Json["image"] ?? "";
    name = Json["name"] ?? "";
    id = Json["id"] ?? 0;
  }
}

class CategoriesData {
  late List<CategoryModel> list;
  CategoriesData.fromJsonList(List<dynamic> JsonList) {
    list = JsonList.map((e) => CategoryModel.fromjson(e)).toList();
  }
}
