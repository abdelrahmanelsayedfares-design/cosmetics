import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Growfet extends StatefulWidget {
  const Growfet({super.key});

  @override
  State<Growfet> createState() => _GrowfetState();
}

class _GrowfetState extends State<Growfet> {
  List<VideosModel>? list;
  Future<void> getData() async {
    final resp = await Dio().get(
      'https://www.googleapis.com/drive/v3/files?q=%271m-LEUh_kP-ykn1vHNsGGjkcPOH-aPmae%27+in+parents+and+mimeType+contains+%27video%27&key=AIzaSyCK64Ze7awjzb22n7CJDIbsS6nYpLR_R0s',
    );
    list = VideosData.fromJson(resp.data).list;
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
      appBar: AppBar(title: Text('Growfet')),
      body: list == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(18.0).r,
              child: ListView.separated(
                itemBuilder: (context, index) => Text(
                  list![index].name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: list!.length,
              ),
            ),
    );
  }
}

class VideosData {
  late final List<VideosModel> list;
  late final String kind;
  late final bool incompleteSearch;

  VideosData.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['files'] ?? [],
    ).map((e) => VideosModel.fromJson(e)).toList();
    kind = json['kind'] ?? "";
    incompleteSearch = json['incompleteSearch'] ?? false;
  }
}

class VideosModel {
  late final String kind;
  late final String id;
  late  String name;
  late final String mimeType;

  VideosModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'] ?? "";
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    final Splits =name.split(".");
    Splits.removeLast();
    name=Splits.join("");
    name=name.replaceAll("_", "");
    name=name.split('').map((e) => e.replaceFirst(e[0], e[0].toUpperCase()),).toList().join(" ");

    // toUpperCase(),).toList().join("");
    mimeType = json['mimeType'] ?? "";
  }
}
